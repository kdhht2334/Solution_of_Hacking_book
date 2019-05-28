#include <stdio.h>

int main() {
  int int_var = 5;
  int *int_ptr;

  int_ptr = &int_var;  // Put the address of int_var into int_ptr.

  printf("int_ptr = ox%o8x\n", int_ptr);
  printf("&int_ptr = ox%o8x\n", &int_ptr);
  printf("*int_ptr = ox%o8x\n\n", *int_ptr);

  printf("int_var is located at ox%o8x and contains %d\n", &int_var, int_var);
  printf("int_ptr is located at ox%o8x, contains ox%o8x, and points to %d\n\n", &int_ptr, int_ptr, *int_ptr);
}
