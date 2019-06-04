#include <stdio.h>

void function() {
  int var = 5;
  static int static_var = 5;  // Static variable initialization

  printf("\t[in function] var @ %p = %d\n", &var, var);
  printf("\t[in function] static_var @ %p = %d\n", &static_var, static_var);
  var++;         // Add one to var.
  static_var++;  // Add one to static_var.
}

int main() {
  int i;
  static int static_var = 1337;  // Another static, in a different context

  for(i=0; i<5; i++) {
    printf("[in main] static_var @ %p = %d\n", &static_var, static_var);
    function();  // Call the function.
  }
}
