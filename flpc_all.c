// cat flpc.c c_names.c > flpc_all.c; tcc -run -g -DTCC flpc_all.c flpc.f
// cat flpc.c c_names.c > flpc_all.c; gcc -gdwarf-2 -g3 flpc_all.c -o flpc; gdb ./flpc
// Alternative:
// cat flpc.c c_names.c > flpc_all.c; gcc -gdwarf-2 -g3 flpc_all.c -o flpc; gdb ./flpc
// (gdb) b _error
// (gdb) b bp
// (gdb) r flpc.f
// (gdb) call print_state()

// When adding primitives, regenerate c_names.c and init_memory.dat
// Edit the hard coded names dict in simulate.py and then run
// python -i simulate.py d


#define LENGTH -1
#define MEMORY_LENGTH 10000000
#define STRINGS_LENGTH 10000000
#define STACK_MAXLEN 10000
#define MAX_NUM_FILES 50
#define FILE_BUFFER_SIZE 150000
#define POS_MAP_LENGTH 20000
// TL: Type bits lengths (least significant x bits indicate types)
#define TL 2
#define call_stack_top call_stack[call_stack[LENGTH] - 1]
#define Pointer 0b10
#define Primitive 0b11
#define String 0b01
#define Int 0b00
#define type(x) (x & 0b11)
#define value(x) (x >> TL)
// Dangerous if evaluating x has a side effect!
#define cvalue(x, y) (type((x)) == (y) ? value((x)) : _error("Unexpected type"))
#define init(C, value) (((value) << TL) + C)
#define None init(Pointer, -1)
#define NoValue init(Pointer, -4)
#define Sep init(Pointer, -2)
#define FileSep init(Pointer, -5)
#define True init(Int, 1)
#define False init(Int, 0)
#define cstring(s) (strings_raw + strings[value(s)] + 1)
#define print_slice(s, start, end) printf("%.*s", end - start, s + start)
#define _assert(cond) if (!(cond)) {_error(#cond);}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <setjmp.h>
// For usleep only
#include <unistd.h>

char *escape[256] = {NULL};
char unescape[256] = {};

// Use struct instead? But then its not as easy to use index notation.
int call_stack_array[STACK_MAXLEN];
int *call_stack;
int prev_call_stack_array[STACK_MAXLEN];
int *prev_call_stack;
int data_stack_array[STACK_MAXLEN];
int *data_stack;
// Stack of variable names, almost with data_stack. Contains Sep which data_stack doesn't.
int local_stack_array[STACK_MAXLEN];
int *local_stack;
// Input stack. Input caching, for rewinding
int input_stack_array[STACK_MAXLEN];
int *input_stack;
int from_input = 0;
int start_stack_len = 0;

int rules_strings_array[50];
int *rules_strings;
int _memoizer[28000][10][50][2];

int *memory_array; //memory_array[MEMORY_LENGTH];
int *memory;
int *memory_hint_array;
int *memory_hint;
int positions[MEMORY_LENGTH][4]; // start, end, 0, 0 (wanted: source_index, filename)
int pos_map_array[POS_MAP_LENGTH][4]; // forth_start, filenum, source_start, source_end
int (*pos_map)[4];
#ifdef TCC
int (*primitives[300])(void);
#else
int (*primitives[])(void);
#endif
char input_buffer[2048];
char strings_raw_array[STRINGS_LENGTH];
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
int num_files;
char filenames[MAX_NUM_FILES][100];
char flpc_sources[MAX_NUM_FILES][FILE_BUFFER_SIZE];
// int filename;

int functions_end, debugger_waitlen, debug_function, debugger_skip, catch_error;
int error_handler;
int run_index, eofunc_index, names_get_index;
int unnamed_string = init(Int, -3);
FILE *input;
int input_index; // -1 means stdin
int STDIN_INDEX = init(Int, -1);
FILE *outf;
struct Files {
  int len;
  FILE *files[10];
} files;
char input_filename[50];

int string_new(char *source);
int raw_string_new(char *source);
void func_call(int func);
int input_next_token();
int print_state();
int _error(char *s);
void call_error_handler();
static jmp_buf error_jump_buffer;

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
    raw_string_new(input_buffer);}
  fscanf(file, "%s", &input_buffer); // #indices
  fscanf(file, "%i", &functions_end);
  fscanf(file, "%i", &names_get_index);
  fscanf(file, "%i", &run_index);
  fscanf(file, "%s", &input_buffer); // #primitive_names
  fscanf(file, "%i", &primitive_names[LENGTH]);
  for(int i=0; i<count; i++){
    fscanf(file, "%s", &input_buffer);
    primitive_names[i] = raw_string_new(input_buffer);}

  file = fopen("pos_map.txt", "r");
  FILE* flpc_fh;
  char filename[100];
  fscanf(file, "%i", &num_files);
  assert(num_files < MAX_NUM_FILES);
  for(int i=0; i<num_files; i++){
    fscanf(file, "%s", &filenames[i]);
    flpc_fh = fopen(filenames[i], "r");
    fread(&flpc_sources[i], FILE_BUFFER_SIZE, 1, flpc_fh);
    fclose(flpc_fh);}
  fscanf(file, "%i", &pos_map[LENGTH][0]);
  assert(pos_map[LENGTH][0] < POS_MAP_LENGTH);
  for(int i=0; i<pos_map[LENGTH][0]; i++){
    fscanf(file, "%i %s %i %i", &pos_map[i][0], &filename, &pos_map[i][2], &pos_map[i][3]);
    int j;
    for(j=0; j<num_files; j++){
      if (strcmp(filename, filenames[j]) == 0) {
        pos_map[i][1] = j;
        break;}}
    if (j == num_files) {_error("Can't find filename");}}
  printf("last pos_map: %i\n", pos_map[pos_map[LENGTH][0] - 1][0]);}

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
    _error("Popping empty data stack!\n");}
  return pop(data_stack);}

void ds_append(int item){
  append(data_stack, item);
  append(local_stack, unnamed_string);}

void prints(int* array){
  for (int i=0; i<array[LENGTH]; i++){
    printf("%i ", array[i]);}
  printf("\n");}

void string_print_repr(int string_index){
  assert(cvalue(string_index, String) < STRINGS_LENGTH); //assert
  fprintf(outf, "\"");
  char* s1 = cstring(string_index);
  _assert(s1[LENGTH] < 500);
  for (int i=0; i<s1[LENGTH]; i++){
    // || s1[i] == '\'' || s1[i] == ' ' 
    if (s1[i] == '\n' || s1[i] == '\r' || s1[i] == '\\' || s1[i] == '"' || s1[i] == '\t' || s1[i] == '"') {
      fprintf(outf, escape[s1[i]]);}
    else {
      fprintf(outf, "%c", s1[i]);}}
  fprintf(outf, "\"");}

void string_print(int string_index){
  char* s1 = cstring(string_index);
  _assert(s1[LENGTH] < 500);
  fprintf(outf, "%.*s", s1[LENGTH], s1);}
/*for (int i=0; i<s1[LENGTH]; i++){
    fprintf(outf, "%c", s1[i]);}}
    if (s1[i] == '_') {
      fprintf(outf, " ");}
    else if (s1[i] == '\\' && s1[i+1] == 'u') {
      fprintf(outf, "_"); i++;}
    else {
    fprintf(outf, "%c", s1[i]);}}}*/

int _string_unescape(int string_index){
  char* s1 = cstring(string_index);
  _assert(s1[LENGTH] < 500);
  char buffer[10000] = "";
  int cur_len = 0;
  for (int i=0; i<s1[LENGTH]; i++){
    if (s1[i] == '_') {
      buffer[cur_len++] = ' ';}
    /*else if (s1[i] == '\\' && s1[i+1] == 'u') {
      buffer[cur_len++] = '_'; i++;}*/
    else if (s1[i] == '\\'){
      i++;
      buffer[cur_len++] = unescape[s1[i]];}
    else {
      buffer[cur_len++] = s1[i];}}
  return raw_string_new(buffer);}

int string_unescape(){
  int string_index = ds_pop();
  return _string_unescape(string_index);}

int string_escape(){
  int string_index = ds_pop();
  char* s1 = cstring(string_index);
  _assert(s1[LENGTH] < 500);
  char buffer[10000] = "";
  int cur_len = 0;
  for (int i=0; i<s1[LENGTH]; i++){
    if (s1[i] == '\n' || s1[i] == '\r' || s1[i] == '\\' || s1[i] == '"' || s1[i] == '_' || s1[i] == ' ' || s1[i] == '\t' || s1[i] == '"') {
      char *replacement = escape[s1[i]];
      for (int j=0; j<2; j++){
        if (replacement[j] == '\0') break;
        buffer[cur_len++] = replacement[j];}}
    else {
      buffer[cur_len++] = s1[i];}}
  return raw_string_new(buffer);}

void string_print_raw(int string_index){
  char* s1 = cstring(string_index);
  _assert(s1[LENGTH] < 500);
  fprintf(outf, "%.*s", s1[LENGTH], s1);}

void tprint(int elem){
  if (type(elem) == Pointer){
    if (elem == None) {
      fprintf(outf, "None");}
    else if (elem == Sep){
      fprintf(outf, "--Sep--");}
    else {
      fprintf(outf, "<mem %i ", value(elem));
      if (value(elem) < memory_hint[LENGTH] && memory_hint[value(elem)]) {
        string_print(memory_hint[value(elem)]);}
      fprintf(outf, ">");
    }}
  else if (type(elem) == Primitive){
    fprintf(outf, "<prim ");
    string_print(primitive_names[value(elem)]);
    fprintf(outf, ">");}
  else if (type(elem) == String){
    string_print_repr(elem);}
  else {
    fprintf(outf, "<int %i>", value(elem));}}

int PRIMITIVE_LENGTH;

int index_of(int(*func)()){
  //sizeof(primitives)/sizeof(primitives[0])
  // Hack!
  for (int i=0; i<PRIMITIVE_LENGTH; i++){
    if (primitives[i] == func){
      return init(Primitive, i);}}}

int _print_mem(int frame){
  for (int j=-5; j<5; j++){
    if (frame+j < 0) continue;
    if (j == 0) {printf("\033[91m");}
    tprint(memory[frame+j]);
    if (j == 0) {printf("\033[0m");}
    printf(" ");}
  printf("\n");}

int print_mem(){
  int val = ds_pop();
  _print_mem(cvalue(val, Pointer));
  return NoValue;}

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
  // Behaviour depends on if this was called from stdin or not
  // !from_input
  if (call_stack[LENGTH] != from_input) {
    // printf("Reading from memory %i\n", call_stack_top);
    call_stack_top += 1;
    return memory[call_stack_top - 1];}
  else {
    // printf("Reading from input\n");
    // from_input = 0;
    return input_next_token();}}

int next_token2(){
  if (call_stack[LENGTH] != from_input + 1) {
    call_stack[call_stack[LENGTH] - 2] += 1;
    return memory[call_stack[call_stack[LENGTH] - 2] - 1];}
  else {
    // printf("Reading from input 2\n");
    // from_input = 0;
    return input_next_token();}}

int push() {
  // Copied from next_command
  if (call_stack[LENGTH] != from_input) {
    // printf("Reading from memory %i\n", call_stack_top);
    call_stack_top += 1;
    return memory[call_stack_top - 1];}
  else {
    // printf("Reading from input\n");
    // from_input = 0;
    return _string_unescape(input_next_token());}}

int pushf() {return next_command();}
int to_int(int s){
  int val = init(Int, atoi(cstring(s)));
  // Caching
  if (call_stack[LENGTH] != from_input){
    memory[call_stack_top - 2] = index_of(push); //push_index;
    memory[call_stack_top - 1] = val;}
  return val;}

int int_(){
  int val = ds_pop();
  if (type(val) == String) {
    // to_int(val) // This doesn't work because we _don't_ want caching
    return init(Int, atoi(cstring(val)));}
  else {
    _error("int() can't handle non-Strings.");}}

int pushi(){
  return to_int(next_command());}

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

int string_hash(int str1){
  assert(type(str1) == String);
  /*printf("Hashing: ");
  string_print(str1);
  printf("\n");*/
  int h = 5381;
  int c;
  char *s = cstring(str1);
  for (int i=0; i < s[LENGTH]; i++){
    // Need to leave room for TL so keeping only the lower 29 bits
    h = (((h << 5) + h) + s[i]) & ((1 << 29) - 1); /* h * 33 + s[i] */}
  assert(init(Int, h) >= 0);
  return h;}

int hash(){
  return init(Int, string_hash(ds_pop()));}

// Find the first unnamed variable and give it the name in the string name
int _assign(int name){
  /*if (local_stack[local_stack[LENGTH]-1] != unnamed_string){
    printf("Can't assign to top of stack\n");}*/
  //assert(local_stack[local_stack[LENGTH]-1] == unnamed_string);
  int i;
  for (i=1; i<local_stack[LENGTH]+1; i++){
    if (local_stack[local_stack[LENGTH]-i] == unnamed_string){
      local_stack[local_stack[LENGTH]-i] = name;
      return NoValue;}}
  _error("Can't assign. All var after separator already named.");}

int assign(){
  return _assign(next_command());}

int assign2(){
  return _assign(ds_pop());}

int check(){
  int command = next_command();
  if (!string_equal_(local_stack[local_stack[LENGTH]-1], command)){
    _error("Failed check:");}
  return NoValue;}

int pick(){
  int name = next_command();
  // printf("Picking "); tprint(name); printf("\n");
  for (int i=local_stack[LENGTH]-1; i >= 0; i--){
    //printf("Comparing to "); tprint(local_stack[i]); printf("\n");
    //printf("result: %i", (string_equal_(local_stack[i], name) == True));
    //printf("\n%i", local_stack[i] == unnamed_string);
    if (local_stack[i] == unnamed_string){
      continue;}
    else if (local_stack[i] == Sep){
      // printf("Not found in locals\n");
      ds_append(name);
      func_call(init(Pointer, names_get_index));
      return NoValue;}
    else if (string_equal_(local_stack[i], name) == True){
      // printf("Returning %i ", i); tprint(data_stack[data_stack[LENGTH] - (local_stack[LENGTH]-1 - i) - 1]);
      return data_stack[data_stack[LENGTH] - (local_stack[LENGTH]-1 - i) - 1];} }
    /*print_state();
      printf("Can't pick "); tprint(name); printf(" out of\n");
      tprint_array(local_stack);
      printf("%i", True == string_equal_(local_stack[local_stack[LENGTH] - 2], name));
      _error("");}}}*/
    ds_append(name);
    func_call(init(Pointer, names_get_index));
    return NoValue;}

int all_data_stack_pick(){
  int name = ds_pop();
  int count = ds_pop();
  count = cvalue(count, Int);
  int sep_count = 0;
  for (int i=local_stack[LENGTH]-1; i >= 0; i--){
    if (local_stack[i] == unnamed_string){
      continue;}
    else if (local_stack[i] == Sep){
      sep_count++;}
    else if (string_equal_(local_stack[i], name) == True){
      if (count == 0) {
        //printf("%d\n", data_stack[LENGTH] - 1 + sep_count - (local_stack[LENGTH] - 1 - i));
        return data_stack[data_stack[LENGTH] - 1 + sep_count - (local_stack[LENGTH] - 1 - i)];}
      else {
        count--;}}}
  bp();
  return None;}

int print_var_stack(int);

int remove_top_names_(int n){
  int i;
  for (i=1; i<n+1; i++){
    assert(local_stack[local_stack[LENGTH] - i] != Sep);
    local_stack[local_stack[LENGTH] - i] = unnamed_string;}
  return NoValue;}

int remove_top_names(){
  return remove_top_names_(value(ds_pop()));}

int newfunc_(int n){
  // Should think of a way to do this with only ds "primitives"
  // But using a temporary buffer also seems wasterful.
  append(input_stack, init(Int, call_stack[LENGTH]));
  append(input_stack, Sep);
  for (int i=0; i<n; i++) {
    append(input_stack, data_stack[data_stack[LENGTH] - n + i]);
    assert(local_stack[local_stack[LENGTH] - i - 1] != Sep);
    local_stack[local_stack[LENGTH] - i] = unnamed_string;}
  local_stack[local_stack[LENGTH] - n] = Sep;
  local_stack[LENGTH] += 1;
  return NoValue;}

int newfunc(){
  return newfunc_(value(ds_pop()));}

int newfunc0(){
  return(newfunc_(0));}

int newfunc1(){
  return(newfunc_(1));}

int newfunc2(){
  return(newfunc_(2));}

int newfunc3(){
  return(newfunc_(3));}

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

/* Joins the first few elements of an array assumed to all be strings. */
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

int sub_str(){
  int v1 = ds_pop(); int v2 = ds_pop();
  int end = cvalue(v1, Int);
  int start = cvalue(v2, Int);
  char* s = cstring(ds_pop());
  char buffer[10000] = "";
  int cur_len = 0;
  for (int i=start; i<end; i++){
    buffer[cur_len++] = s[i];}
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

int str_endswith(){
  int fs2 = ds_pop();
  char* s = cstring(fs2);
  int fs1 = ds_pop();
  char* suffix = cstring(fs1);
  int diff = s[LENGTH] - suffix[LENGTH];
  if (diff < 0) {
    return False;}
  for (int i=0; i<suffix[LENGTH]; i++){
    if (suffix[i] != s[i + diff]) return False;}
  return True;}

int int_to_str(){
  int x = ds_pop();
  char buffer[20];
  //sprintf(buffer, "%d", cvalue(x, Int));
  sprintf(buffer, "%d", value(x));
  // itoa(num, buffer, 10);
  return raw_string_new(buffer);}

int _isspace(char c) {return (c == ' ' || c == '\n' || c == '\r' || c == '\t');}
int _isalpha(char c) {return (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z');}
int is_alpha(){
  char* s = cstring(ds_pop());
  if (s[LENGTH] == 0) {return False;}
  for (int i=0; i<s[LENGTH]; i++){
    if (!_isalpha(s[i])) return False;}
  return True;}

int str_next_token(){
  // Consumes spaces at the beginning, then returns all characters
  // up to the next space of end of string.
  int fs = ds_pop();
  int start = value(ds_pop());
  if (type(fs) != String) {_error("Getting str_next_token of non-string");}
  char *s = cstring(fs);
  if (start > s[LENGTH]) {
    _error("start past string length.\n");}
  if (start == s[LENGTH]) {
    ds_append(init(Int, start));
    return raw_string_new("");}
  while(start < s[LENGTH] && _isspace(s[start])){
    start++;}
  char buffer[10000] = "";
  int current;
  for (current=start; current < s[LENGTH] && !_isspace(s[current]); current++){
    buffer[current - start] = s[current];}
  buffer[current - start + 1] = '\0';
  ds_append(init(Int, current));
  return raw_string_new(buffer);}

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
                    type(elem) == Primitive ||
                    elem == None || elem == NoValue));}

int type_of(){
  int elem = ds_pop();
  return init(Int, type(elem));}

int func_end(){
  pop(call_stack); return NoValue;}

int return_no_value(){
  while(local_stack[local_stack[LENGTH]-1] != Sep){
    ds_pop();}
  while(pop(input_stack) != Sep){;}
  pop(input_stack); // Call stack length
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

int rewind_(){
  int num_calls = value(ds_pop());
  int input_stack_length = 0;
  // This isn't the right number of frames of call stack to pop.
  // Don't know how many but need to find when newfunc was called.
  for (int i=0; i < num_calls; i++){
    input_stack_length = input_stack[LENGTH];
    return_no_value();}
  int call_stack_length = cvalue(input_stack[input_stack[LENGTH]], Int);
  // Bad! Abusing the fact that popped input stack (from return_no_value())
  // doesn't actually erase the values.
  for (int i=input_stack[LENGTH] + 2; i < input_stack_length; i++){
    ds_append(input_stack[i]);}
  while(call_stack[LENGTH] >= call_stack_length){
    pop(call_stack);}
  // Call function again. Unfortunately, prev_call_stack temporarily has the wrong value.
  call_stack_top = prev_call_stack[call_stack[LENGTH] - 1];
  return NoValue;}

int unescape_string_new(char *source){
  // Replace escape sequences with chars equivalent.
  // Replaces _ with space.
  strings[strings[LENGTH]] = strings_raw_length;
  int orig_length = strings_raw_length;
  strings_raw_length++;
  for (int i=0; i<strlen(source); i++){
    if (source[i] == '\\'){
      i++;
      strings_raw[strings_raw_length++] = unescape[source[i]];}
    else if (source[i] == '_') {
      strings_raw[strings_raw_length++] = ' ';}
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
  // Need to fix this too. Only prompt when reading from stdin and nothing else to read.
  if (input == stdin) {printf("> ");}
  last_pos[0] = ftell(input);
  if (fscanf(input, "%s", input_buffer) == EOF) {
    //fread(&input_buffer, 2048, 1, input);
    last_pos[1] = ftell(input);
    // Bad because we're effectively assuming only input_loop call this.
    pop(call_stack);
    pop(call_stack);
    return NoValue;}
    //return string_new("return_no_value2");}
  last_pos[1] = ftell(input);
  // printf("*** Read token %.*s\n", last_pos[1] - last_pos[0], file_source + last_pos[0]);
  return raw_string_new(input_buffer);}

int input_next_triple_quote(){
  last_pos[0] = ftell(input);
  char char_buffer[2];
  int len = -1;
  while(!(len > 3
          && (input_buffer[len - 1] == input_buffer[len - 2])
          && (input_buffer[len - 2] == input_buffer[len - 3])
          && (input_buffer[len - 3] == '\''))){
    if (fscanf(input, "%c", char_buffer) == EOF) {
      last_pos[1] = ftell(input);
      input_buffer[len] = '\0';
      printf("%s", input_buffer);
      _error("A triple-quote was not closed.");}
    //printf("%i %c\n", len, char_buffer[0]);
    // Ignores only first char so its still possible to start with a space.
    if (len >= 0) {input_buffer[len] = char_buffer[0];}
    len++;}
  // Should assert last char is whitespace?
  input_buffer[len - 3 - 1] = '\0';
  last_pos[1] = ftell(input);
  return raw_string_new(input_buffer);}

int triple_quote(){
  if (call_stack[LENGTH] != from_input) {
    // printf("Reading from memory %i\n", call_stack_top);
    call_stack_top += 1;
    return memory[call_stack_top - 1];}
  else {
    return input_next_triple_quote();}}

int stdin_next_token() {
  // printf("Reading from stdin\n");
  if (scanf("%s", input_buffer) == EOF) {_error("EOF reached");}
  return unescape_string_new(input_buffer);}

// May buffer overflow
int stdin_next_line() {
  //if (scanf(" %[^\n]", input_buffer) == EOF) {
  size_t bufsize = 2048;
  char *buffer = input_buffer;
  if (getline(&buffer, &bufsize, stdin) == EOF) {
    /* Doesn't seem to work as intended (allowing us to read
       more from stdin after a control-D. Right now, using line
       with single letter q to exit prompt. */
    //fread(&input_buffer, 2048, 1, input);
    //clearerr(stdin);
    return(None);}
  else {
    for (int i=0; ;i++){
      if (buffer[i] == '\n') {
        buffer[i] = '\0';
        break;}}
    return raw_string_new(input_buffer);}}

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
  // Next non-space char. Used for the "token" grammar rule.
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

int fd_next_line(){
  FILE* fd = files.files[value(ds_pop())];
  char c[2];
  char buffer[10000] = "";
  int start = ftell(fd);
  for (int i=0;;i++){
    if (!fread(&c, 1, 1, fd)) {
      // Probably end of file?
      if (ftell(fd) != start) {
        buffer[i] = '\0';
        return raw_string_new(buffer);}
      return None;}
    if (c[0] == '\n') {
      buffer[i] = c[0];
      buffer[i+1] = '\0';
      return raw_string_new(buffer);}
    buffer[i] = c[0];}}

// Not strictly needed since we have set_output
int fd_write(){
  FILE* fd = files.files[value(ds_pop())];
  int fs = ds_pop();
  char* s = cstring(fs);
  _assert(s[LENGTH] < 500);
  fprintf(fd, "%.*s", s[LENGTH], s);
  fflush(fd);
  return NoValue;}

int fd_flush(){
  FILE* fd = files.files[value(ds_pop())];
  fflush(fd);
  return NoValue;}

int fd_ended(){
  FILE* fd = files.files[value(ds_pop())];
  return feof(fd);}

int file_close(){
  FILE* fd = files.files[value(ds_pop())];
  fclose(fd);
  return NoValue;}

int file_open_at_(int index){
  char *filename = cstring(ds_pop());
  char *mode = cstring(ds_pop());
  char buf[50];
  char mode_buf[3];
  sprintf(buf, "%.*s", filename[LENGTH], filename);
  sprintf(mode_buf, "%.*s", mode[LENGTH], mode);
  files.files[index] = fopen(buf, mode_buf);
  if (files.files[index] == NULL) {
    printf("Error opening file %s\n", buf);
    _error("Error opening file");}
  return init(Int, index);}

int file_open_at(){
  return file_open_at_(value(ds_pop()));}

int file_open(){
  return file_open_at_(files.len++);}

int set_output(){
  // Could check for errors and return values depending on that.
  int file_num = ds_pop();
  if (file_num == None) {
    outf = stdout;}
  else {
    outf = files.files[value(file_num)];}
  return NoValue;}

int msleep(){
  int usec = value(ds_pop());
  usleep(usec * 1000);
  return NoValue;}

void func_call(int func){
  // printf("Calling %i %i\n", type(func), value(func));
  if (type(func) == Pointer){
    append(call_stack, value(func));
    prev_call_stack[call_stack[LENGTH] - 1] = call_stack_top;}
  else if (type(func) == Primitive){
    assert(func >= 0);
    int output = primitives[value(func)]();
    if (output != NoValue) {ds_append(output);}
  } else {
    _error("Called a non pointer or primitive");}}

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

int call_from_input(){
  // Ugly hack. Only relevant when calling primitives that call next_command
  // Probably still doesn't work well when nested?
  from_input = call_stack[LENGTH];
  return call();}

int print_() {
  int elem = ds_pop();
  if (type(elem) == String) {string_print(elem);}
  else {tprint(elem);}
  return NoValue;}
int printraw() {
  string_print_raw(ds_pop()); return NoValue;}
int printrepr() {
  string_print_repr(ds_pop()); return NoValue;}
int printspace() {fprintf(outf, " "); return NoValue;}
int printeol() {fprintf(outf, "\n"); return NoValue;}
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
  assert(debugger_waitlen == None || debugger_waitlen == NoValue || debugger_waitlen >= 0);
  // NoValue means don't ever break
  // None means always break
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
  FILE* prof_file;
  //prof_file = fopen("profile.txt", "w");
  while(call_stack[LENGTH] > start_stack_len){
    assert(call_stack[LENGTH] > 0 && call_stack[LENGTH] < 10000);
    assert(call_stack == call_stack_array + 1);
    /*if (call_stack[LENGTH] == 4){
      print_state();}
    if (call_stack_top == functions_end - 7){
    print_state();}*/
    /*for (int i=0; i<call_stack[LENGTH]; i++){
      fprintf(prof_file, "%i ", call_stack[i]);}
      fprintf(prof_file, "\n");*/
    debugger();
    if (call_stack[start_stack_len] > 1){
      _error("Call stack went beyond starting point.");}
    if (call_stack_top > memory[LENGTH]){
      _error("Call stack past end of memory!");}
    prev_call_stack[call_stack[LENGTH] - 1] = call_stack_top;
    func = memory[call_stack_top];
    call_stack_top += 1;
    if (setjmp(error_jump_buffer)) {
      call_error_handler();
    } else {
      func_call(func);}}}

int unimpl(){
  _error("Unimplemented");}

int error(){
  char* cs = cstring(ds_pop());
  char buf[100];
  sprintf(buf, "%.*s", cs[LENGTH], cs);
  _error(buf);
  print_state();}
  //exit(1);}

int _error(char *s){
  printf("Error: %s\n", s);
  ds_append(raw_string_new(s));
  longjmp(error_jump_buffer, 1);}
  //exit(1);}

int error_handler_set() {
  error_handler = ds_pop();
  assert(type(error_handler) == Primitive || type(error_handler) == Pointer);
  return NoValue;}

void call_error_handler() {
  if (error_handler != None) {
    prev_call_stack[call_stack[LENGTH] - 1] = call_stack_top;
    func_call(error_handler);}
  else {
    printf("No error handler set. Exiting.");
    exit(1);}}

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
  int x = ds_pop(); int i = value(ds_pop());
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

int memory_hint_get() {return memory_hint[value(ds_pop())];}
int memory_hint_set() {
  int index = ds_pop(); int x = ds_pop();
  int i = value(index);
  /*printf("Setting %i to %i ", i, x);
  string_print(x);
  printf("\n");*/
  if (type(index) != Pointer){
    printf("Not setting memory hint to non-pointer %i\n", index);}
  else if (i == -1) {
    printf("Not setting memory hint None\n");}
  else if (i < memory_hint[LENGTH]){
    memory_hint[i] = x;}
  else if (i == memory_hint[LENGTH]) {
    append(memory_hint, x);}
  else {
    printf("%d %d", i, x);
    _error("Setting index greater than memory hint length");}
  return NoValue;}

int pos_map_index(int forth_index){
  for(int i=0; i<pos_map[LENGTH][0]; i++){
    if (forth_index < pos_map[i][0]) return i - 1;}
  _error("Position in source not found");}

void print_boot_frame(int frame){
  char *source;
  char *fn;
  int* pos = positions[frame];
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
      printf("\n"); }

void _print_frame(int frame, int context){
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
      _print_mem(frame);}
    else if (!pos[2]) {
      print_boot_frame(frame);}
    else {
      // printf("%i %i %i\n", pos[0], pos[1], pos[2]);
      /*if (pos[2]) {source = file_source; fn = input_filename;}
        else {source = boot_source; fn = "<boot>";}*/
      int (*fpos)[4] = pos_map + pos_map_index(pos[0] + 1);
      source = flpc_sources[(*fpos)[1]];
      fn = filenames[(*fpos)[1]];
      int prev = 0, first = -1, j, lineno = 0, first_lineno;
      for (j=0; j<strlen(source); j++){
        if (source[j] == '\n') {
          if (j > (*fpos)[2] && first == -1) {first = prev; first_lineno = lineno;}
          if (j >= (*fpos)[3]) {break;}
          lineno += 1;
          prev = j;}}
      for(int count=0; count<context+1; j++) {
        if (source[j] == '\n') count++;}
      for(int count=0; count<context+1; first--) {
        if (source[first] == '\n') count++;}
      // printf("%i %i ", first, j);
      printf("  In file \033[92m%s\033[0m line %i function \033[92m(", fn, first_lineno);
      tprint(memory[frame]);
      printf(")\033[0m");
      print_slice(source, first, (*fpos)[2]);
      printf("\033[91m");
      print_slice(source, (*fpos)[2], (*fpos)[3]);
      printf("\033[0m");
      print_slice(source, (*fpos)[3], j);
      printf("\n"); }}

int print_frame(){
  int i = value(ds_pop());
  int context = value(ds_pop());
  // Bad: should probably be a different function.
  int raw_memory_location = value(ds_pop());
  int frame = raw_memory_location ? i :
    (prev_call_stack[i] ? prev_call_stack[i] : call_stack[i]);
  printf("%i", i);
  _print_frame(frame, context);
  return NoValue;}

// start = -1 means print everything
int print_stack(int start){
  int frame;
  for (int i=0; i<call_stack[LENGTH]; i++){
    if (start != -1 && i < call_stack[LENGTH] - start) {continue;}
    frame = prev_call_stack[i] ? prev_call_stack[i] : call_stack[i];
    printf("%i", i);
    _print_frame(frame, 1);}
  return NoValue;}

// sep_diff = -1 means print everything
int print_var_stack(int sep_diff) {
  //int i = 0;
  int num_sep = 0;
  for (int j = 0; j < local_stack[LENGTH]; j++){
    if (local_stack[j] == Sep){num_sep++;}}
  int max_num_sep = num_sep;
  //for (int j = 0; j < local_stack[LENGTH]; j++){
  for (int j = local_stack[LENGTH] - 1; j >= 0; j--){
    if (local_stack[j] != Sep){
      if (local_stack[j] == unnamed_string){
        ;}
      else if (type(local_stack[j]) == String) {
        string_print_raw(local_stack[j]);}
      else {
        _error("Unknown name!");}// tprint(local_stack[j]); exit(1);}
      printf(": ");
      tprint(data_stack[j - num_sep]);
      printf("\n");}
    else {
      num_sep--;
      if (sep_diff != -1 && max_num_sep - num_sep > sep_diff) break;
      printf("-----\n");}}}

int print_input_stack(int sep_diff) {
  //int i = 0;
  int num_sep = 0;
  for (int j = 0; j < input_stack[LENGTH]; j++){
    if (input_stack[j] == Sep){num_sep++;}}
  int max_num_sep = num_sep;
  //for (int j = 0; j < input_stack[LENGTH]; j++){
  for (int j = input_stack[LENGTH] - 1; j >= 0; j--){
    if (input_stack[j] != Sep){
      tprint(input_stack[j]);
      printf("\n");}
    else {
      num_sep--;
      if (sep_diff != -1 && max_num_sep - num_sep > sep_diff) break;
      printf("-----\n");}}}

void print_input_state(){
  int l = 30;
  printf("Input: %.*s", l, file_source + (last_pos[0] - l));
  printf("\033[91m");
  printf("%.*s", last_pos[1] - last_pos[0], file_source + (last_pos[0]));
  printf("\033[0m");
  printf("%.*s\n", l, file_source + (last_pos[1]));
  printf("input_buffer: ");
  printf("%s\n", input_buffer);}

int print_state() {
  // printf("Input: %.*s\n", last_pos[1] - last_pos[0] + 40, file_source + (last_pos[0] - 20));
  print_input_state();
  printf("\ndata_stack:\n");
  print_var_stack(5);
  printf("\ninput_stack:\n");
  print_input_stack(5);
  print_stack(6);
  printf("\n");
  /*printf("\nnext tokens from input:\n");
  for (int i=0; i<10; i++){
  tprint(input_next_token()); printf(" ");}*/
  return NoValue;}

int print_full_state() {
  printf("call_stack: ");
  prints(call_stack);
  printf("next_command: ");
  tprint(memory[call_stack_top]);
  printf("\n");

  printf("\ndebugger_waitlen: %i\n", debugger_waitlen);
  printf("debug_function: "); tprint(debug_function); printf("\n");
  print_input_state();
  printf("data_stack:\n");
  print_var_stack(-1);
  printf("input_stack:\n");
  print_input_stack(-1);
  print_stack(-1);
  printf("\n");}

int ps() {print_full_state();}
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
int mod() {int v1 = ds_pop(); int v2 = ds_pop();
  return init(Int, cvalue(v2, Int) % cvalue(v1, Int));}
int intdiv() {int v1 = ds_pop(); int v2 = ds_pop();
  return init(Int, cvalue(v2, Int) / cvalue(v1, Int));}
int greater() {return init(Int, ds_pop() < ds_pop());}
int less() {int v1 = ds_pop(); int v2 = ds_pop();
  return init(Int, v1 > v2);}
int bin_or() {int v1 = ds_pop(); int v2 = ds_pop();
  return init(Int, cvalue(v2, Int) || cvalue(v1, Int));}
int bin_and() {int v1 = ds_pop(); int v2 = ds_pop();
  return init(Int, cvalue(v2, Int) && cvalue(v1, Int));}
int equal() {return init(Int, ds_pop() == ds_pop());}
int drop1() {ds_pop(); return NoValue;}
int s21() {int v1 = ds_pop(); int v2 = ds_pop(); ds_append(v1); return v2;}
int s4127() {
  int a = ds_pop(); int b = ds_pop(); ds_pop(); int d = ds_pop();
  ds_pop(); ds_pop();
  ds_append(b); ds_append(a); return d;}
void shuffle_string(char *s) {
  int data_stack_copy[10];
  int ord0 = 48;
  int len = s[LENGTH];
  int max = 0;
  for (int i=0; i<s[LENGTH]; i++){
    max = s[i] > max ? s[i] : max;}
  // Need to properly handle unique last element case!
  // The current version is not correct for, say, s11.
  if (max == s[s[LENGTH] - 1]) {
    max -= 1;
    len -= 1;}
  max = max - ord0;
  if (max > 9) {_error("Shuffling index above 9!\n");}
  for (int i=0; i<max; i++){
    data_stack_copy[i] = ds_pop();}
  for (int i=0; i<len; i++){
    ds_append(data_stack_copy[s[len - 1 - i] - ord0 - 1]);}}
int shuffle() {
  shuffle_string(cstring(ds_pop()));
  return NoValue;}
int debugger_waitlen_set() {
  debugger_waitlen = value(ds_pop());
  // Hack for setting None
  if (debugger_waitlen == -1) {debugger_waitlen = None;}
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

// name pos indentation
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
  memset(_memoizer, 0, sizeof _memoizer);
  rules_strings[LENGTH] = 0;
  return NoValue;}

void setup_escape(){
  escape['\0'] = "\\0";
  escape['\n'] = "\\n";
  escape['\r'] = "\\r";
  escape['\t'] = "\\t";
  escape[' '] = "_";
  escape['_'] = "\\u";
  escape['"'] = "\\q";
  escape['\''] = "'";
  escape['"'] = "\\q";
  escape['\\'] = "\\\\";
  unescape['0'] = '\0';
  unescape['n'] = '\n';
  unescape['r'] = '\r';
  unescape['t'] = '\t';
  unescape['s'] = ' ';
  unescape['q'] = '"';
  unescape['u'] = '_';
  unescape['\\'] = '\\';
  unescape['('] = '(';
  unescape[')'] = ')';}

int continue_from_file(){
  int top = ds_pop();
  assert(top == FileSep); // p top
  input_index = value(ds_pop());
  char* filename = cstring(ds_pop());
  sprintf(input_filename, "%.*s", filename[LENGTH], filename);
  printf("Continuing from file %s\n", input_filename);
  input = files.files[input_index];
  if (input != stdin){
    int pos = ftell(input);
    fseek(input, 0, SEEK_SET);
    fread(&file_source, FILE_BUFFER_SIZE, 1, input);
    fseek(input, pos, SEEK_SET);}
  return NoValue;}

// Switch future input stream to a (new) file.
void run_file_(char *filename){
  sprintf(input_filename, "%.*s", filename[LENGTH], filename);
  printf("Running from file %s\n", input_filename);
  input = files.files[files.len] = fopen(input_filename, "r");
  if (files.files[files.len] == NULL) {
    printf("Error opening file %s\n", input_filename);
    _error("Error opening file");}
  input_index = files.len++;
  fread(&file_source, FILE_BUFFER_SIZE, 1, input);
  fseek(input, 0, SEEK_SET);}

int current_input_file() {
  // Save previous file into onto stack. To be used by continue_from_file
  // Should possibly make this into primitives.
  ds_append(raw_string_new(input_filename));
  ds_append(init(Int, input_index));
  ds_append(FileSep);
  return NoValue;}

int switch_input_file() {
  char* filename = cstring(ds_pop());

  run_file_(filename);
  start_stack_len = call_stack[LENGTH];
  append(call_stack, 0);
  // Not sure if nested main loop is needed.
  // Currently used as indicator when we run out of input
  main_loop();
  // if (input != stdin) fclose(input);
  from_input = 3;
  // Wrong! Should probably push these values onto the param stack or something.
  start_stack_len = 0;
  return NoValue;}

int main(int argc, char *argv[]) {
  outf = stdout;
  setup_escape();
  call_stack = call_stack_array + 1;
  prev_call_stack = prev_call_stack_array + 1;
  data_stack = data_stack_array + 1;
  local_stack = local_stack_array + 1;
  input_stack = input_stack_array + 1;
  rules_strings = rules_strings_array + 1;
  memory_array = malloc((MEMORY_LENGTH + 1) * sizeof(int));
  memory = memory_array + 1;
  memory_hint_array = malloc((MEMORY_LENGTH + 1) * sizeof(int));
  memory_hint = memory_hint_array + 1;
  memory_hint[LENGTH] = MEMORY_LENGTH;
  pos_map = &pos_map_array[1];
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
  eofunc_index = init(Primitive, index_of(func_end)); // Hack!
  catch_error = False;

  // Can we somehow fold the two cases together?
  if (argc == 1) {
    sprintf(input_filename, "%.*s", 5, "stdin");
    printf("Running from stdin\n");
    input = stdin;}
  else {
    run_file_(cstring(raw_string_new(argv[1])));}
  FILE* boot = fopen("lib/boot.flpc", "r");
  fread(&boot_source, FILE_BUFFER_SIZE, 1, boot);
  fclose(boot);
  debugger_waitlen = NoValue;
  debug_function = None;
  error_handler = None;
  append(call_stack, 0);
  main_loop();
  // Shouldn't really be hard-coded here.
  if (input != stdin) {
    fclose(input);
    append(call_stack, 0);
    input = stdin;
    main_loop();}
  printf("EOF reached. Mem used: %i\n", memory[LENGTH]);}

void test(){
  append(call_stack, 10);
  append(call_stack, 20);
  prints(call_stack);
  primitives[0]();
  prints(primitive_names);
  string_print(primitive_names[0]);
  }
int PRIMITIVE_LENGTH = 132;
int (*primitives[])(void) = {load, shuffle, str_endswith, input_next_triple_quote, fd_next_line, memoizer_get, bin_or, continue_from_file, file_close, triple_quote, load_state, file_open, input_next_token, if_else, call_stack_len, _cheat_dict_new, fd_position_set, newfunc1, str_join, func_end, pushi, _cheat_dict_set, newfunc0, zero, newfunc2, two, call, fd_position, drop1, memory_hint_set, newfunc, less, string_equal, greater, s4127, func_end, type_of, equal, return_if, error_handler_set, sub_str, return4, int_to_str, call_from_input, stdin_next_line, not_, return_no_value, str_next_token, mempos_append, mod, save_state, printspace, print_state, memoizer_set, return_two1, return_two2, names_set, debugger_waitlen_set, return1, current_input_file, return3, return2, printraw, error, fd_write, functions_end_increase, debug_function_set, fd_startswith, memory_get, functions_end_, assign2, char_between, prm, str_len, assign, functions_end_decrease, memoizer_reset, functions_end_, msleep, string_escape, fd_ended, memory_set, return_no_value2, remove_top_names, pick, string_unescape, add, sub, pick1, intdiv, printeol, one, fpointer, switch_input_file, rewind_, print_, stdin_next_token, if_, fd_next_token, None_, repeat, hash, next_token2, push, fd_next_char, lookup_error, save, memory_len, pushf, bp, call_stack_top2, bin_and, is_basic, memory_hint_get, c_infinity, cache_slot, print_frame, fd_flush, repeat_if, is_str, printrepr, memory_append, file_open_at, is_alpha, _cheat_dict_get, newfunc3, int_, s21, check, all_data_stack_pick, print_mem, set_output};
