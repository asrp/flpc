// cat flpc.c c_names.c > flpc_all.c; tcc -run -g -DTCC flpc_all.c flpc.f
// cat flpc.c c_names.c > flpc_all.c; gcc -gdwarf-2 -g3 flpc_all.c -o flpc; gdb ./flpc
// (gdb) b _error
// (gdb) b bp
// (gdb) r flpc.f
// (gdb) call print_state()

#define LENGTH -1
#define MEMORY_LENGTH 10000000
#define STACK_MAXLEN 10000
#define FILE_BUFFER_SIZE 100000
// TL: Type bits lengths (least significant x bits indicate types)
#define TL 2
#define call_stack_top call_stack[call_stack[LENGTH] - 1]
#define Pointer 0b10
#define Primitive 0b11
#define String 0b01
#define Int 0b00
#define type(x) (x & 0b11)
#define value(x) (x >> TL)
#define cvalue(x, y) (type((x)) == (y) ? value((x)) : _error("Unexpected type"))
#define init(C, value) (((value) << TL) + C)
#define None init(Pointer, -1)
#define NoValue init(Pointer, -4)
#define Sep init(Pointer, -2)
#define True init(Int, 1)
#define False init(Int, 0)
#define cstring(s) (strings_raw + strings[value(s)] + 1)
#define print_slice(s, start, end) printf("%.*s", end - start, s + start)
#define _assert(cond) if (!(cond)) {_error(#cond);}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

char *escape[256] = {NULL};
char unescape[256] = {NULL};

// Use struct instead? But then its not as easy to use index notation.
int call_stack_array[STACK_MAXLEN];
int *call_stack;
int prev_call_stack_array[STACK_MAXLEN];
int *prev_call_stack;
int data_stack_array[STACK_MAXLEN];
int *data_stack;
int local_stack_array[STACK_MAXLEN];
int *local_stack;

int rules_strings_array[50];
int *rules_strings;
int _memoizer[28000][10][50][2];

int memory_array[MEMORY_LENGTH];
int *memory;
int positions[MEMORY_LENGTH][4]; // source_index, filename, start, end
#ifdef TCC
int (*primitives[300])(void);
#else
int (*primitives[])(void);
#endif
char input_buffer[2048];
char strings_raw_array[10000000];
int strings_raw_length;
char *strings_raw;
// TODO: Stop creating new strings when reading the input!
// Only save the ones we actually need!
int strings_array[1000000];
int *strings;
int primitive_names_array[1001];
int *primitive_names;
int last_pos[2];
char boot_source[FILE_BUFFER_SIZE];
char file_source[FILE_BUFFER_SIZE];
int filename;

int functions_end, debugger_waitlen, debug_function, debugger_skip, catch_error;
int run_index, eofunc_index;
int unnamed_string = init(Int, -3);
FILE *input;
struct Files {
  int len;
  FILE *files[10];
} files;
char *input_filename;

int string_new(char *source);
int raw_string_new(char *source);
void func_call(int func);
int input_next_token();
int print_state();
int _error(char *s);

int bp() {return NoValue;} // Set gdb to break here before running
void load_all(){
  FILE *file;
  int i, entries;
  file = fopen("init_memory.dat", "r");
  fscanf(file, "%s", &input_buffer); // #memory
  fscanf(file, "%i", &memory[LENGTH]);
  fscanf(file, "%i", &entries);
  printf("Entries to read: %i\n", entries);
  for(int i=0; i<entries; i++){
    fscanf(file, "%i", &memory[i]);}
  fscanf(file, "%s", &input_buffer); // #position
  fscanf(file, "%i", &memory[LENGTH]);
  for(int i=0; i<entries; i++){
    fscanf(file, "%i", &positions[i][0]);
    fscanf(file, "%i", &positions[i][1]);
    if (positions[i][0] != None){
      // <boot>, source_index
      positions[i][2] = 0;
      positions[i][3] = 0;}}
  for(int i=entries; i<memory[LENGTH]; i++){
    memory[i] = None;
    positions[i][0] = None;
    positions[i][1] = None;}
  fscanf(file, "%s", &input_buffer); // #strings
  int count;
  fscanf(file, "%i", &count);
  for(int i=0; i<count; i++){
    fscanf(file, "%s", &input_buffer);
    string_new(input_buffer);}
  fscanf(file, "%s", &input_buffer); // #functions_end
  fscanf(file, "%i", &functions_end);
  fscanf(file, "%s", &input_buffer); // #primitive_names
  fscanf(file, "%i", &primitive_names[LENGTH]);
  for(int i=0; i<count; i++){
    fscanf(file, "%s", &input_buffer);
    primitive_names[i] = string_new(input_buffer);}}

void append(int* array, int item){
  if (array != memory && array[LENGTH] > 10000) {_error("array LENGTH overwritten!");}
  array[array[LENGTH]] = item;
  array[LENGTH] += 1;}

int pop(int* array){
  if (!array[LENGTH]) {_error("Popping from empty stack!\n");}
  array[LENGTH] -= 1;
  return array[array[LENGTH]];}

int ds_pop(){
  if (pop(local_stack) == Sep){
    _error("Popping empty data stack!\n"); print_state();}
  return pop(data_stack);}

void ds_append(int item){
  append(data_stack, item);
  append(local_stack, unnamed_string);}

void prints(int* array){
  for (int i=0; i<array[LENGTH]; i++){
    printf("%i ", array[i]);}
  printf("\n");}

void string_print_repr(int string_index){
  char* s1 = cstring(string_index);
  _assert(s1[LENGTH] < 500);
  for (int i=0; i<s1[LENGTH]; i++){
    if (s1[i] == '\n' || s1[i] == '\r' || s1[i] == '\\' || s1[i] == '\"' ||
        s1[i] == '\'') {
      printf(escape[s1[i]]);}
    else {
      printf("%c", s1[i]);}}}

void string_print(int string_index){
  char* s1 = cstring(string_index);
  _assert(s1[LENGTH] < 500);
  for (int i=0; i<s1[LENGTH]; i++){
    if (s1[i] == '_') {
      printf(" ");}
    else if (s1[i] == '\\' && s1[i+1] == 'u') {
      printf("_"); i++;}
    else {
      printf("%c", s1[i]);}}}

void string_print_raw(int string_index){
  char* s1 = cstring(string_index);
  _assert(s1[LENGTH] < 500);
  printf("%.*s", s1[LENGTH], s1);}

void tprint(int elem){
  if (type(elem) == Pointer){
    if (elem == None) {
      printf("None");}
    else if (elem == Sep){
      printf("--Sep--");}
    else {
      printf("<mem %i>", value(elem));}}
  else if (type(elem) == Primitive){
    printf("<prim ");
    string_print(primitive_names[value(elem)]);
    printf(">");}
  else if (type(elem) == String){
    printf("\"");
    string_print_repr(elem);
    printf("\"");}
  else {
    printf("<int %i>", value(elem));}}

int index_of(int(*func)()){
  //sizeof(primitives)/sizeof(primitives[0])
  // Hack!
  for (int i=0; i<94; i++){
    if (primitives[i] == func){
      return init(Primitive, i);}}}

int prm(){
  int elem;
  for (int i=0; i<memory[LENGTH]; i++){
    elem = memory[i];
    if (elem == None) {
      printf(".");}
    else if (type(elem) == Pointer){
      printf("%01X", value(elem) / 100);}
    else if (type(elem) == Primitive){
      char* s = cstring(primitive_names[value(elem)]);
      printf("%c", s[0]);
      if (s[0] == ']') printf("\n");}
    else if (type(elem) == String){
      printf("'");}
    else {
      printf("i");}}
  printf("\n");}

void tprint_array(int* array){
  // Need object dependent print here later on.
  for (int i=0; i<array[LENGTH]; i++){
    tprint(array[i]); printf(", ");}
  printf("\n");}

int next_command(){
  if (call_stack[LENGTH] != 3){
    // printf("Reading from memory %i\n", call_stack_top);
    call_stack_top += 1;
    return memory[call_stack_top - 1];}
  else {
    // printf("Reading from input\n");
    return input_next_token();}}

int next_token2(){
  if (call_stack[LENGTH] != 4){
    call_stack[call_stack[LENGTH] - 2] += 1;
    return memory[call_stack[call_stack[LENGTH] - 2] - 1];}
  else {
    // printf("Reading from input 2\n");
    return input_next_token();}}

int push() {return next_command();}
int pushf() {return next_command();}
int pushi(){
  int val = init(Int, atoi(cstring(next_command())));
  if (call_stack[LENGTH] > 3){
    memory[call_stack_top - 2] = index_of(push); //push_index;
    memory[call_stack_top - 1] = val;}
  return val;}

int pick1() {return data_stack[data_stack[LENGTH]-1];}

int string_equal_(int str1, int str2){
  char *s1 = cstring(str1);
  char *s2 = cstring(str2);
  if (s1[LENGTH] != s2[LENGTH]) {return False;}
  for (int i=0; i<s1[LENGTH]; i++){
    if (s1[i] != s2[i]) {return False;}}
  return True;}

int string_equal_s(int str1, char *s2){
  char *s1 = cstring(str1);
  if (s1[LENGTH] != strlen(s2)) {return False;}
  for (int i=0; i<s1[LENGTH]; i++){
    if (s1[i] != s2[i]) {return False;}}
  return True;}

int string_equal() {
  return string_equal_(ds_pop(), ds_pop());}

int assign(){
  /*if (local_stack[local_stack[LENGTH]-1] != unnamed_string){
    printf("Can't assign to top of stack\n");}*/
  //assert(local_stack[local_stack[LENGTH]-1] == unnamed_string);
  int i;
  for (i=1; i<local_stack[LENGTH]+1; i++){
    if (local_stack[local_stack[LENGTH]-i] == unnamed_string){
      local_stack[local_stack[LENGTH]-i] = next_command();
      return NoValue;}}
  _error("Can't assign. All var after separator already named.");}

int check(){
  int command = next_command();
  if (!string_equal_(local_stack[local_stack[LENGTH]-1], command)){
    _error("Failed check:");}
  return NoValue;}

int pick(){
  int name = next_command();
  // printf("Picking "); tprint(name); printf("\n");
  for (int i=local_stack[LENGTH]-1; ; i--){
    //printf("Comparing to "); tprint(local_stack[i]); printf("\n");
    //printf("result: %i", (string_equal_(local_stack[i], name) == True));
    //printf("\n%i", local_stack[i] == unnamed_string);
    if (local_stack[i] == unnamed_string){
      continue;}
    else if (local_stack[i] == Sep || i == 0){
      // printf("Not found in locals\n");
      ds_append(name);
      func_call(init(Pointer, 182));
      return NoValue;}
    else if (string_equal_(local_stack[i], name) == True){
      // printf("Returning %i ", i); tprint(data_stack[data_stack[LENGTH] - (local_stack[LENGTH]-1 - i) - 1]);
      return data_stack[data_stack[LENGTH] - (local_stack[LENGTH]-1 - i) - 1];} }}
    /*print_state();
      printf("Can't pick "); tprint(name); printf(" out of\n");
      tprint_array(local_stack);
      printf("%i", True == string_equal_(local_stack[local_stack[LENGTH] - 2], name));
      _error("");}}}*/

int newfunc0(){
  append(local_stack, Sep); return NoValue;}

int newfunc1(){
  int val = ds_pop();
  append(local_stack, Sep);
  ds_append(val);
  return NoValue;}

int newfunc2(){
  int val1 = ds_pop();
  int val2 = ds_pop();
  append(local_stack, Sep);
  ds_append(val2);
  ds_append(val1);
  return NoValue;}

int newfunc3(){
  int val1 = ds_pop();
  int val2 = ds_pop();
  int val3 = ds_pop();
  append(local_stack, Sep);
  ds_append(val3);
  ds_append(val2);
  ds_append(val1);
  return NoValue;}

int if_(){
  int index = ds_pop();
  if (ds_pop() == True){
    func_call(index);}
  return NoValue;}

int if_else(){
  int false_index = ds_pop();
  int true_index = ds_pop();
  if (ds_pop() == True){
    func_call(true_index);}
  else {
    func_call(false_index);}
  return NoValue;}

char unescaped(char ch){
  if (ch == 'n' || ch == 't' || ch == 'r' || ch == 's' || ch == 'u'){
    return unescape[ch];}
  else if (ch == '\\' | ch == '(' || ch == ')'){
    return ch;}
  else {
    _error("Unknown escape char");}}

int str_join(){
  int length = value(ds_pop());
  int array = value(ds_pop());
  char buffer[10000] = "";
  int cur_len = 0;
  char* s;
  for (int i=0; i<length; i++){
    s = cstring(memory[array + i]);
    for (int j=0; j<s[LENGTH]; j++){
      // Assuming already escaped
      /*if (s[j] == '\\'){
        j++;
        buffer[cur_len++] = escaped(s[j]);}
        else {*/
        buffer[cur_len++] = s[j];}}
  buffer[cur_len++] = '\0';
  return raw_string_new(buffer);}

int str_len(){
  int fs = ds_pop();
  // Size zero resizable arrays. Should do something about these.
  // But they were possibly needed to semantically distinguish from
  // the empty string.
  if (type(fs) == Pointer && memory[value(fs)] == False) {return False;}
  if (type(fs) != String) {_error("Getting str_len of non-string");}
  char *s = cstring(fs);
  return init(Int, s[LENGTH]);}

int _isspace(char c) {return (c == ' ' || c == '\n' || c == '\r' || c == '\t');}
int _isalpha(char c) {return (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z');}
int is_alpha(){
  char* s = cstring(ds_pop());
  if (s[LENGTH] == 0) {return False;}
  for (int i=0; i<s[LENGTH]; i++){
    if (!_isalpha(s[i])) return False;}
  return True;}

int char_between(){
  char* c = cstring(ds_pop());
  char* e = cstring(ds_pop());
  char* s = cstring(ds_pop());
  return (init(Int, (c[0] >= s[0] && c[0] <= e[0])));}

int is_str(){
  return init(Int, type(ds_pop()) == String);}

int is_basic(){
  int elem = ds_pop();
  return init(Int, (type(elem) == String || type(elem) == Int ||
                    elem == None || elem == NoValue));}

int func_end(){
  pop(call_stack); return NoValue;}

int return_no_value(){
  while(local_stack[local_stack[LENGTH]-1] != Sep){
    ds_pop();}
  pop(local_stack);
  pop(call_stack);
  return NoValue;}

int return_if(){
  int index = ds_pop();
  // Should accept more true values!
  if (ds_pop() == True){
    return_no_value();
    return index;}
  return NoValue;}

int return_no_value2(){
  return_no_value();
  pop(call_stack);
  return NoValue;}

int return1(){
  int ret_val = ds_pop();
  return_no_value();
  return ret_val;}

int return_two1(){
  int val1 = ds_pop();
  int val2 = ds_pop();
  return_no_value();
  ds_append(val2);
  return val1;}

int return_two2(){
  int val1 = ds_pop();
  int val2 = ds_pop();
  return_no_value();
  pop(call_stack);
  ds_append(val2);
  return val1;}

int return2(){
  int ret_val = ds_pop();
  return_no_value();
  pop(call_stack);
  return ret_val;}

int return3(){
  int ret_val = ds_pop();
  return_no_value();
  pop(call_stack);
  pop(call_stack);
  return ret_val;}

int return4(){
  int ret_val = ds_pop();
  return_no_value();
  pop(call_stack);
  pop(call_stack);
  pop(call_stack);
  return ret_val;}

int string_new(char *source){
  strings[strings[LENGTH]] = strings_raw_length;
  int orig_length = strings_raw_length;
  strings_raw_length++;
  for (int i=0; i<strlen(source); i++){
    if (source[i] == '\\' && source[i+1] != 'u'){
      i++;
      strings_raw[strings_raw_length++] = unescaped(source[i]);}
    else {
      strings_raw[strings_raw_length++] = source[i];}}
  strings_raw[orig_length] = strings_raw_length - orig_length - 1;
  //strcpy(strings_raw + strings_raw_length + 1, source);
  strings[LENGTH] += 1;
  return init(String, strings[LENGTH] - 1);}

int raw_string_new(char *source){
  strings[strings[LENGTH]] = strings_raw_length;
  int orig_length = strings_raw_length;
  strings_raw_length++;
  for (int i=0; i<strlen(source); i++){
    strings_raw[strings_raw_length++] = source[i];}
  strings_raw[orig_length] = strings_raw_length - orig_length - 1;
  //strcpy(strings_raw + strings_raw_length + 1, source);
  strings[LENGTH] += 1;
  return init(String, strings[LENGTH] - 1);}

int char_new(char c){
  strings[strings[LENGTH]] = strings_raw_length;
  strings_raw[strings_raw_length] = 1;
  strings_raw[strings_raw_length + 1] = c;
  strings_raw_length += 2;
  strings[LENGTH] += 1;
  return init(String, strings[LENGTH] - 1);}

int input_next_token() {
  if (input == stdin) {printf("> ");}
  last_pos[0] = ftell(input);
  if (fscanf(input, "%s", input_buffer) == EOF) {
    if (input != stdin) {input = stdin; return input_next_token();}
    else {printf("EOF reached\n"); exit(0);}} //_error("EOF reached");
  last_pos[1] = ftell(input);
  // printf("*** Read token %.*s\n", last_pos[1] - last_pos[0], file_source + last_pos[0]);
  return string_new(input_buffer);}

int stdin_next_token() {
  printf("Reading from stdin\n");
  if (scanf("%s", input_buffer) == EOF) {_error("EOF reached");}
  return string_new(input_buffer);}

int fd_position(){
  FILE* fd = files.files[value(ds_pop())];
  return init(Int, ftell(fd));}

int fd_position_set(){
  int index = value(ds_pop());
  FILE* fd = files.files[value(ds_pop())];
  fseek(fd, index, SEEK_SET);
  return NoValue;}

int fd_startswith(){
  FILE* fd = files.files[value(ds_pop())];
  int fs = ds_pop();
  char* s = cstring(fs);
  char c[2];
  c[0] = ' ';
  while(_isspace(c[0])){
    if (!fread(&c, 1, 1, fd)) {
      return None;}}
  fseek(fd, -1, SEEK_CUR);
  for (int i=0; i<s[LENGTH]; i++){
    if (!fread(&c, 1, 1, fd)) return None;
    if (c[0] != s[i]) return None;}
  return fs;}

int fd_next_token(){
  char c[2];
  FILE* fd = files.files[value(ds_pop())];
  c[0] = ' ';
  while(_isspace(c[0])){
    if (!fread(&c, 1, 1, fd)) {
      return None;}}
  //printf("Next token: %c\n", c[0]);
  return char_new(c[0]);}

int fd_next_char(){
  char c[2];
  FILE* fd = files.files[value(ds_pop())];
  if (!fread(&c, 1, 1, fd)) {
    return None;}
  //printf("Next char: %c\n", c[0]);
  return char_new(c[0]);}

int fd_ended(){
  FILE* fd = files.files[value(ds_pop())];
  return feof(fd);}

int file_open(){
  char *filename = cstring(ds_pop());
  char buf[50];
  sprintf(buf, "%.*s", filename[LENGTH], filename);
  files.files[files.len++] = fopen(buf, "r");
  return init(Int, files.len - 1);}

void func_call(int func){
  // printf("Calling %i %i\n", type(func), value(func));
  if (type(func) == Pointer){
    append(call_stack, value(func));
    prev_call_stack[call_stack[LENGTH] - 1] = call_stack_top;}
  else if (type(func) == Primitive){
    int output = primitives[value(func)]();
    if (output != NoValue) {ds_append(output);}}}

int repeat(){
  call_stack_top -= 3;
  int func = ds_pop();
  func_call(func);
  return NoValue;}

int repeat_if(){
  int block = value(ds_pop());
  if (data_stack[data_stack[LENGTH]-1] == False){
    ds_pop();
  } else {
    call_stack_top -= 3;
    append(call_stack, block);}
  return NoValue;}

int call(){
  int val = ds_pop();
  _assert(type(val) == Primitive || val > init(Pointer, 4));
  func_call(val);
  return NoValue;}

int print_() {
  int elem = ds_pop();
  if (type(elem) == String) {string_print(elem);}
  else {tprint(elem);}
  return NoValue;}
int printraw() {
  string_print_raw(ds_pop()); return NoValue;}
int printrepr() {
  printf("\""); string_print_repr(ds_pop()); printf("\""); return NoValue;}
int printspace() {printf(" "); return NoValue;}
int printeol() {printf("\n"); return NoValue;}
int print_repr() {tprint(ds_pop()); return NoValue;}

int char_equal(int s, char c){
  char* s1 = cstring(s);
  return (s1[LENGTH] == 1 && s1[0] == c);}

// No longer used. Now entirely in Forth
void forth_debugger(){
  //printf("data_stack: "); tprint_array(data_stack);
  catch_error = False;
  int command;
  int loop = True;
  while(loop){
    printf("(dbg) ");
    command = stdin_next_token();
    loop = False;
    if (char_equal(command, 's')) {
      debugger_waitlen = None;}
    else if (char_equal(command, 'n')) {
      debugger_waitlen = call_stack[LENGTH];}
    else if (char_equal(command, 'r')) {
      debugger_waitlen = call_stack[LENGTH] - 1;}
    else if (char_equal(command, 'c')) {
      debugger_waitlen = 0;}
    else if (char_equal(command, 'i')) {
      printf("call_stack: ");
      prints(call_stack);
      printf("data_stack: ");
      tprint_array(data_stack);
      printf("\n");
      // print_names(call_stack);
      loop = True;}
    else if (char_equal(command, 'l')) {
      // print surrounding code
      loop = True;}
    else {
      printf("Running %s\n", cstring(command));
      debugger_waitlen = call_stack[LENGTH];
      ds_append(command);
      catch_error = True;
      func_call(run_index);}}}

void debugger(){
  // print_state();
  /*if (call_stack[call_stack[LENGTH] - 2] != 75){
    print_state();
    printf("\n");
    printf("debugger_waitlen %i\n", debugger_waitlen);}*/
  if (debugger_waitlen == None || debugger_waitlen >= call_stack[LENGTH]) {
    if (debugger_skip == True) {
      debugger_skip = False;
      printf("*** new debugger_waitlen: %i\n", debugger_waitlen);
      return;}
    debugger_waitlen = 0;
    prev_call_stack[call_stack[LENGTH] - 1] = call_stack_top;
    func_call(debug_function);}}

void main_loop(){
  int func;
  while(call_stack[LENGTH]){
    /*if (call_stack[LENGTH] == 4){
      print_state();}
    if (call_stack_top == functions_end - 7){
    print_state();}*/
    debugger();
    prev_call_stack[call_stack[LENGTH] - 1] = call_stack_top;
    func = memory[call_stack_top];
    call_stack_top += 1;
    func_call(func);}}

int unimpl(){
  _error("Unimplemented");}

int error(){
  string_print(ds_pop());
  printf("\n");
  _error("");
  print_state();
  exit(1);}

int _error(char *s){
  printf(s); printf("\n");
  exit(1);}
 
int lookup_error(){
  print_state();
  if (!catch_error) {_error("Lookup_error");}
  else {ds_pop();}}

int one() {return init(Int, 1);}
int zero() {return init(Int, 0);}
int two() {return init(Int, 2);}

int memory_len() {return init(Int, memory[LENGTH]);}

int mempos_append() {
  // printf("mempos %i %i\n", last_pos[0], last_pos[1]);
  // printf("%.*s\n", last_pos[1] - last_pos[0], file_source + last_pos[0]);
  positions[memory[LENGTH]][0] = last_pos[0];
  positions[memory[LENGTH]][1] = last_pos[1];
  positions[memory[LENGTH]][2] = 1; // filename;
  positions[memory[LENGTH]][3] = 1; // source;
  append(memory, ds_pop());
  //prm();
  return NoValue;}

int memory_append() {
  positions[memory[LENGTH]][0] = -1;
  append(memory, ds_pop());
  return NoValue;}

int memory_get() {return memory[value(ds_pop())];}
int memory_set() {
  int i = value(ds_pop()); int x = ds_pop();
  //if (type(i) == Pointer) {i = value(i);}
  /*printf("Functions end %i\n", functions_end);
  printf("Setting %i to %i\n", i, x);
  prints(memory);*/
  if (i < memory[LENGTH]){
    memory[i] = x;}
  else if (i == memory[LENGTH]) {
    append(memory, x);}
  else {
    _error("Setting index greater than memory length");}
  return NoValue;}

void print_frame(int frame){
  char *source;
  char *fn;
    int* pos = positions[frame];
    if (pos[0] == None || pos[0] < 0){
      printf("  Unknown position \033[92m");
      if (frame < 4 || type(frame) != Pointer) {
        printf("%i", frame);}
      else {
        tprint(frame);}
      printf("\033[0m\n");
      for (int j=-5; j<5; j++){
        if (frame+j < 0) continue;
        if (j == 0) {printf("\033[91m");}
        tprint(memory[frame+j]);
        if (j == 0) {printf("\033[0m");}
        printf(" ");}
      printf("\n");}
    else {
      // printf("%i %i %i\n", pos[0], pos[1]);
      if (pos[2]) {source = file_source; fn = input_filename;}
      else {source = boot_source; fn = "<boot>";}
      int prev = 0, first = -1, j, lineno = 0, first_lineno;
      for (j=0; j<strlen(source); j++){
        if (source[j] == '\n') {
          if (j > pos[0] && first == -1) {first = prev; first_lineno = lineno;}
          if (j > pos[1]) {break;}
          lineno += 1;
          prev = j;}}
      // printf("%i %i ", first, j);
      printf("  In file \033[92m%s\033[0m line %i function \033[92m(", fn, first_lineno);
      tprint(memory[frame]);
      printf(")\033[0m");
      print_slice(source, first, pos[0]);
      printf("\033[91m");
      print_slice(source, pos[0], pos[1]);
      printf("\033[0m");
      print_slice(source, pos[1], j);
      printf("\n"); }}

int print_stack(){
  int frame;
  for (int i=0; i<call_stack[LENGTH]; i++){
    if (i < call_stack[LENGTH] - 10) {continue;}
    frame = prev_call_stack[i] ? prev_call_stack[i] : call_stack[i];
    printf("%i", i);
    print_frame(frame);}
  return NoValue;}

int print_state() {
  printf("call_stack: ");
  prints(call_stack);
  printf("next_command: ");
  tprint(memory[call_stack_top]);
  printf("\n");
  printf("data_stack:\n");
  int i = 0;
  for (int j = 0; j < local_stack[LENGTH]; j++){
    if (local_stack[j] != Sep){
      if (local_stack[j] == unnamed_string){
        ;}
      else if (type(local_stack[j]) == String) {
        string_print(local_stack[j]);}
      else {
        _error("Unknown name!");}// tprint(local_stack[j]); exit(1);}
      printf(": ");
      tprint(data_stack[i]);
      printf("\n");
      i++;}
    else {
      printf("-----\n");}}
  printf("\ndebugger_waitlen: %i\n", debugger_waitlen); 
  printf("debug_function: "); tprint(debug_function); printf("\n");
  print_stack();
  printf("\n");
  /*printf("\nnext tokens from input:\n");
  for (int i=0; i<10; i++){
  tprint(input_next_token()); printf(" ");}*/
  return NoValue;}

int ps() {print_state();}
int fpointer() {return init(Pointer, value(ds_pop()));}

int not_() {return init(Int, !value(ds_pop()));}
int functions_end_() {return init(Pointer, functions_end);}
int functions_end_increase() {functions_end += 1; return NoValue;}
int functions_end_decrease() {functions_end -= 1; return NoValue;}
int None_() {return None;}
int c_infinity() {return init(Int, 1000);}
int call_stack_len() {return init(Int, call_stack[LENGTH]);}
// Need to wrap these??
int call_stack_top_() {return call_stack_top;}
int call_stack_top2() {return call_stack[call_stack[LENGTH] - 2];}
// Should check values are ints?
int sub() {int v = ds_pop(); return ds_pop() - v;}
int add() {return ds_pop() + ds_pop();}
int greater() {return init(Int, ds_pop() < ds_pop());}
int less() {int v1 = ds_pop(); int v2 = ds_pop();
  return init(Int, v1 > v2);}
int equal() {return init(Int, ds_pop() == ds_pop());}
int drop1() {ds_pop(); return NoValue;}
int s21() {int v1 = ds_pop(); int v2 = ds_pop(); ds_append(v1); return v2;}
int s4127() {
  int a = ds_pop(); int b = ds_pop(); ds_pop(); int d = ds_pop();
  ds_pop(); ds_pop();
  ds_append(b); ds_append(a); return d;}
int debugger_waitlen_set() {
  debugger_waitlen = value(ds_pop());
  debugger_skip = True;
  if (debug_function == None){
    debug_function = memory[call_stack[call_stack[LENGTH]-2] - 1];}
  return_no_value();
  return NoValue;}
int debug_function_set() {debug_function = value(ds_pop()); return NoValue;}

int cache_slot() {return NoValue;} //No-op to be overwritten by cached value
int load_state() {printf("Unimplemented load_state\n"); return NoValue;}
int save_state() {printf("Unimplemented save_state\n"); return NoValue;}
int load() {printf("Unimplemented load\n"); ds_pop(); return NoValue;}
int save() {printf("Unimplemented save\n"); ds_pop(); return NoValue;}
int _cheat_dict_new() {printf("Unimplemented _cheat_dict_new\n"); return NoValue;}
int _cheat_dict_get() {printf("Unimplemented _cheat_dict_get\n"); return NoValue;}
int _cheat_dict_set() {printf("Unimplemented _cheat_dict_set\n"); return NoValue;}
int repr() {printf("Unimplemented repr\n"); ds_pop(); return NoValue;}
int names_set() {printf("Unimplemented names_set\n"); return NoValue;}

// Need to be made faster once it works.
int _string_index(int s){
  for (int i=0; i<rules_strings[LENGTH]; i++){
    if (string_equal_(rules_strings[i], s) == True) {return i;}}
  append(rules_strings, s);
  return rules_strings[LENGTH] - 1;}

int memoizer_get(){
  // len(indentation) This is a heuristic that is wrong in general.
  // Should extract values as a tuple instead.
  int val = ds_pop();
  int k3 = cvalue(memory[cvalue(val, Pointer)], Int);
  val = ds_pop();
  int k2 = cvalue(val, Int);
  int name = ds_pop();
  int k1 = _string_index(name);
  // Uncomment to disable memoizer
  //  ds_append(None); ds_append(None);
  //  return False;
  // Result is the same but side effect isn't.
  if (string_equal_s(name, "INDENT") ||
      string_equal_s(name, "DEDENT") ||
      string_equal_s(name, "SAME_INDENT")){
    ds_append(None); ds_append(None);
    return False;}
  if (_memoizer[k2][k3][k1][0]){
    /*printf("Cache hit ");
    string_print(name);
    printf(" %i", k2);
    int v1 = _memoizer[k2][k3][k1][0];
    int v2 = _memoizer[k2][k3][k1][1];
    printf(" %i to ", k3);
    tprint(v1);
    printf(" %i\n", cvalue(v2, Int));
    if (k2 == 51) {bp();}*/
    ds_append(_memoizer[k2][k3][k1][0]); ds_append(_memoizer[k2][k3][k1][1]);
    return True;}
  ds_append(None); ds_append(None);
  return False;}

int memoizer_set(){
  int v2 = ds_pop(); int v1 = ds_pop();
  int val = ds_pop();
  int k3 = cvalue(memory[cvalue(val, Pointer)], Int);
  val = ds_pop();
  int k2 = cvalue(val, Int);
  int name = ds_pop();
  int k1 = _string_index(name);
  /*printf("Setting memoizer at ");
  string_print(name);
  printf(" %i", k2);
  printf(" %i to ", k3);
  tprint(v1);
  printf(" %i\n", cvalue(v2, Int));*/
  //if (v2 < k2) {_error("What?");}
  //if (k2 == 51) {bp();}
  _memoizer[k2][k3][k1][0] = v1;
  _memoizer[k2][k3][k1][1] = v2;
  return NoValue;}

int memoizer_reset() {
  memset(_memoizer, 0, sizeof _memoizer);}

void setup_escape(){
  escape['\0'] = "\\0";
  escape['\n'] = "\\n";
  escape['\r'] = "\\r";
  escape['\t'] = "\\t";
  escape[' '] = "\\s";
  escape['_'] = "\\u";
  escape['\''] = "'";
  escape['\"'] = "\"";
  escape['\\'] = "\\\\";
  unescape['0'] = '\0';
  unescape['n'] = '\n';
  unescape['r'] = '\r';
  unescape['t'] = '\t';
  unescape['s'] = ' ';
  unescape['u'] = '_';}

int main(int argc, char *argv[]) {
  setup_escape();
  call_stack = call_stack_array + 1;
  prev_call_stack = prev_call_stack_array + 1;
  data_stack = data_stack_array + 1;
  local_stack = local_stack_array + 1;
  rules_strings = rules_strings_array + 1;
  memory = memory_array + 1;
  // positions = positions_array + 1;
  primitive_names = primitive_names_array + 1;
  strings = strings_array + 1;
  strings[LENGTH] = 0;
  strings_raw = strings_raw_array + 1;
  strings_raw_length = 0;
  printf("FLPC interpreter\n");
  for(int i=0; i<MEMORY_LENGTH - 1; i++){
    memory[i] = 0;}
  for(int i=0; i<MEMORY_LENGTH - 1; i++){
    positions[i][0] = None;}
  load_all();
  run_index = init(Pointer, 72); // Hack!
  eofunc_index = init(Primitive, index_of(func_end)); // Hack!
  catch_error = False;

  if (argc == 1) {
    input_filename = "stdin";
    printf("Running from stdin\n");
    input = stdin;}
  else {
    input_filename = argv[1];
    printf("Running from file %s\n", input_filename);
    input = fopen(input_filename, "r");
    fread(&file_source, FILE_BUFFER_SIZE, 1, input);
    fseek(input, 0, SEEK_SET);}
  FILE* boot = fopen("lib/boot.flpc", "r");
  fread(&boot_source, FILE_BUFFER_SIZE, 1, boot);
  fclose(boot);
  debugger_waitlen = 0; //NoValue;
  debug_function = None;
  append(call_stack, 0);
  main_loop();}

void test(){
  append(call_stack, 10);
  append(call_stack, 20);
  prints(call_stack);
  primitives[0]();
  prints(primitive_names);
  string_print(primitive_names[0]);
  }
int (*primitives[])(void) = {zero, pushf, load_state, if_else, call_stack_len, str_join, _cheat_dict_new, is_alpha, newfunc2, save_state, printspace, less, s4127, func_end, memory_set, equal, return_if, not_, return_no_value, mempos_append, print_state, printraw, functions_end_increase, debug_function_set, fd_startswith, str_len, functions_end_decrease, functions_end_, return_no_value2, add, memoizer_get, print_, return4, None_, push, debugger_waitlen_set, lookup_error, bp, file_open, cache_slot, repeat_if, names_set, _cheat_dict_get, newfunc3, check, fpointer, load, c_infinity, newfunc0, fd_position_set, newfunc1, pushi, _cheat_dict_set, two, call, fd_position, drop1, string_equal, greater, input_next_token, printrepr, save, memoizer_set, return_two1, return_two2, functions_end_, fd_ended, return1, return3, return2, fd_next_token, error, memory_len, memory_get, char_between, prm, assign, memoizer_reset, if_, pick, sub, pick1, printeol, one, stdin_next_token, call_stack_top2, repeat, next_token2, fd_next_char, is_basic, func_end, is_str, memory_append, s21};
