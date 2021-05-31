#define LENGTH -1
#define MEMORY_LENGTH 10000000
#define STRINGS_LENGTH 10000000
#define MAX_NUM_STRINGS 1000000
#define STACK_MAXLEN 10000
#define MAX_NUM_FILES 50
#define MAX_NUM_RUNTIME_FILES 50
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
