// gcc -shared -x c -o globals.so -fPIC globals.c

#include "common.h"
#include <stdio.h>
#include <stdlib.h>

// Needs underscore or for some reason dlopen isn't able to load!
int *g_memory_array; //memory_array[MEMORY_LENGTH];
int *g_memory;
int *g_memory_hint_array;
int *g_memory_hint;
int g_call_stack_array[STACK_MAXLEN];
int *g_call_stack;
int g_prev_call_stack_array[STACK_MAXLEN];
int *g_prev_call_stack;
int g_data_stack_array[STACK_MAXLEN];
int *g_data_stack;
int g_local_stack_array[STACK_MAXLEN];
int *g_local_stack;
// Input stack. Input caching, for rewinding. Contains function arguments.
int g_input_stack_array[STACK_MAXLEN];
int *g_input_stack;
char g_strings_raw_array[STRINGS_LENGTH];
int g_strings_raw_length;
char *g_strings_raw;
// TODO: Stop creating new strings when reading the input!
// Only save the ones we actually need!
int g_strings_array[MAX_NUM_STRINGS];
int *g_strings;

void print_pointers(){
  printf("%p %p %p\n", g_memory, g_memory_hint, g_call_stack);
}

void reinit(){
  printf("Reinit globals\n");
  g_call_stack = g_call_stack_array + 1;
  g_call_stack[0] = 0;
  g_memory_array = malloc((MEMORY_LENGTH + 1) * sizeof(int));
  g_memory = g_memory_array + 1;
  g_memory_hint_array = malloc((MEMORY_LENGTH + 1) * sizeof(int));
  g_memory_hint = g_memory_hint_array + 1;
  g_memory_hint[LENGTH] = MEMORY_LENGTH;
  g_call_stack = g_call_stack_array + 1;
  g_prev_call_stack = g_prev_call_stack_array + 1;
  g_data_stack = g_data_stack_array + 1;
  g_local_stack = g_local_stack_array + 1;
  g_input_stack = g_input_stack_array + 1;
  g_strings = g_strings_array + 1;
  g_strings[LENGTH] = 0;
  g_strings_raw = g_strings_raw_array + 1;
  g_strings_raw_length = 1;
  print_pointers();
}
