#include <stdio.h>

int main() {
  printf("The 'int' datatype is\t\t %d bytes\n", sizeof(int));
  printf("The 'unsigned int' datatype is\t\t %d bytes\n", sizeof(unsigned int));
  printf("The 'short int' datatype is\t\t %d bytes\n", sizeof(short int));
  printf("The 'long int' datatype is\t\t %d bytes\n", sizeof(long int));
  printf("The 'long long int' datatype is\t\t %d bytes\n", sizeof(long long int));
  printf("The 'float' datatype is\t\t %d bytes\n", sizeof(float));
  printf("The 'char' datatype is\t\t %d bytes\n", sizeof(char));
}
