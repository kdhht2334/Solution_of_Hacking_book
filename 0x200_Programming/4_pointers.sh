# 0x263 Pointers
gcc -o pointer pointer.c
./pointer
# Hello, world!
# llo, world!
# Hey you guys!

# Let's take a look at pointer address and contents.
gcc -g -o pointer pointer.c
gdb -q ./pointer
# (gdb) list
# 1	#include <stdio.h>
# 2	#include <string.h>
# 3
# 4	int main() {
# 5	  char str_a[20];  // A 20-element character array
# 6	  char *pointer;   // A pointer, meant for a character array
# 7	  char *pointer2;  // And yet another one
# 8
# 9	  strcpy(str_a, "Hello, world!\n");
# 10	  pointer = str_a;  // Set the first pointer to the start of the array.
# (gdb)
# 11	  printf(pointer);
# 12
# 13	  pointer2 = pointer + 2; // Set the second one 2 bytes further in.
# 14	  printf(pointer2);
# 15	  strcpy(pointer2, "y you guys!\n");
# 16	  printf(pointer);
# 17	}
# (gdb) break 11
# Breakpoint 1 at 0x4005d7: file pointer.c, line 11.
# (gdb) run
# Starting program: /home/daehakim/Desktop/Research/hacking/pointer

# Breakpoint 1, main () at pointer.c:11
# 11	  printf(pointer);
# (gdb) x/xw pointer
# 0x7fffffffe2b0:	0x6c6c6548
# (gdb) x/s pointer
# 0x7fffffffe2b0:	"Hello, world!\n"

# Note that the string itself isn't stored in the pointer variable
# - only the memory address `0x7fffffffe2b0` is stored there.

# And in order to see the actual data stored in the pointer variable,
# you must use the address-of operator.
# This operator exists both in GDB and in the C programming language.

# (gdb) x/xw &pointer (address-of operator)
# 0x7fffffffe2a0:	0xffffe2b0 (memory address)
# (gdb) print &pointer
# $1 = (char **) 0x7fffffffe2a0
# (gdb) print pointer
# $2 = 0x7fffffffe2b0 "Hello, world!\n"

# When the address-of operator is used, the pointer variable is shown to
# be located at the address `0x7fffffffe2a0` in memory, and it contains
# the address `0xffffe2b0`.

# The addressof.c program demonstrates the address-of operator being used
# to put the address of an integer variable into a pointer.

gcc -g addressof.c
gdb -q ./a.out

(gdb) list
# 1	#include <stdio.h>
# 2
# 3	int main() {
# 4	  int int_var = 5;
# 5	  int *int_ptr;
# 6
# 7	  int_ptr = &int_var;  // put the address of int_var into int_ptr
# 8	}

# (gdb) break 8
# (gdb) run

# (gdb) print int_var
# $1 = 5
# (gdb) print &int_var
# $2 = (int *) 0x7fffffffe2bc
# (gdb) print int_ptr
# $3 = (int *) 0x7fffffffe2bc  (same as before!)
# (gdb) print &int_ptr
# $4 = (int **) 0x7fffffffe2c0

# Also `de-reference` operator exists for use with pointers.
# This operator will return the data found in the address the pointer is pointing to,
# instead of the address itself.
# (gdb) print *int_ptr
# $5 = 5

gcc addressof2.c
./a.out
# int_ptr = ox136407204348x
# &int_ptr = ox136407204408x
# *int_ptr = ox58x

# int_var is located at ox136407204348x and contains 5
# int_ptr is located at ox136407204408x, contains ox136407204348x, and points to 5
