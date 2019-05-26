# 0x261 Strings

# GCC compiler can also be given the `-o` switch to define the output file to compile to
gcc -o char_array char_array.c
./char_array
Hello, world!

gcc -g -o char_array2 char_array2.c

# Go to debugging mode!
gdb -q ./char_array2

# Check source code
# (gdb) list
# 1	#include <stdio.h>
# 2	#include <string.h>
# 3
# 4	int main() {
# 5	  char str_a[20];
# 6
# 7	  strcpy(str_a, "Hello, world!\n");
# 8	  printf(str_a);
# 9	}

# (gdb) break 6
# Breakpoint 1 at 0x4005ad: file char_array2.c, line 6.
# (gdb) break strcpy
# Function "strcpy" not defined.
# Make breakpoint pending on future shared library load? (y or [n]) y
# Breakpoint 2 (strcpy) pending.
# (gdb) break 8
# Breakpoint 3 at 0x4005cf: file char_array2.c, line 8.

# Run debugging...
# (gdb) run
# The program being debugged has been started already.
# Breakpoint 1, main () at char_array2.c:7
# 7	  strcpy(str_a, "Hello, world!\n");

# Check register
# (gdb) i r rip
# rip            0x4005ad	0x4005ad <main+23>
# (gdb) x/5i $rip
# => 0x4005ad <main+23>:	lea    -0x20(%rbp),%rax
#    0x4005b1 <main+27>:	movabs $0x77202c6f6c6c6548,%rdx
#    0x4005bb <main+37>:	mov    %rdx,(%rax)
#    0x4005be <main+40>:	movl   $0x646c726f,0x8(%rax)
#    0x4005c5 <main+47>:	movw   $0xa21,0xc(%rax)
# (gdb) continue
# Continuing.
# Breakpoint 3, main () at char_array2.c:8
# 8	  printf(str_a);

# The address in RIP at the middle breakpoint is different
# because the code for the strcpy() func. comes from a loaded library
# (gdb) i r rip
# rip            0x4005cf	0x4005cf <main+57>

# Do re-run
# (gdb) run
# The program being debugged has been started already.
# Breakpoint 1, main () at char_array2.c:7
# 7	  strcpy(str_a, "Hello, world!\n");

# `bt` commmand can be used to backtrace the stack
# (gdb) bt
# #0  main () at char_array2.c:7
# (gdb) cont
# Continuing.
# Breakpoint 3, main () at char_array2.c:8
# 8	  printf(str_a);

# Also the `strcpy()` func. is at a slightly different address during the second run
# (gdb) bt
# #0  main () at char_array2.c:8
# (gdb) cont
# Continuing.
# Hello, world!
# [Inferior 1 (process 3389) exited normally]
#
