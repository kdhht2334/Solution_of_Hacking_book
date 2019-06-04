# 0x267 Variable Scoping

# Each function has its own set of local variables, which are independent
# of everything else.
# We can use the `printf()` function with format strings to explore this.

gcc -o scope scope.c
./scope.out
# [in main] i = 3
# 	[in func1] i = 5
# 			[in func3] i = 11
# 		[back in func2] i = 7
# 	[back in func1] i = 5
# [back in main] i = 3

# It means that each function call has its own version of the variable `i`.

# Next, variables can also have a global scope, which means they will persist
# across all functions.
# Variables are global if they are defined at the beginning of the src code.

gcc -o scope2 scope2.c
./scope2.out
# [in main] i = 3, j = 43
# 	[in func1] i = 5, j = 43
# 		[in func2] i = 7, j = 43
# 		[in func2] setting j = 1337
# 			[in func3] i = 11, j = 999
# 		[back in func2] i = 7, j = 1337
# 	[back in func1] i = 5, j = 1337
# [back in main] i = 3, j = 1337

# Global variable `j` is just stored in memory, and every function ia able to
# access that memory.
# In contrast, local variables for each function are each stored in their own 
# places in memory.

# Let's check memory addresses of these variables :)
gcc -o scope3 scope3.c
./scope3.out
# [in main] i @ 0xc53f18a4 = 3
# [in main] j @ 0x00601048 = 43
# 	[in func1] i @ 0xc53f1884 = 5
# 	[in func1] j @ 0x00601048 = 43
# 		[in func2] i @ 0xc53f1864 = 7
# 		[in func2] j @ 0x00601048 = 43
# 		[in func2] setting j = 1337
# 			[in func3] i @ 0xc53f1840 = 11
# 			[in func3] j @ 0xc53f1844 = 999
# 		[back in func2] i @ 0xc53f1864 = 7
# 		[back in func2] j @ 0x00601048 = 1337
# 	[back in func2] i @ 0xc53f1884 = 5
# 	[back in func2] j @ 0x00601048 = 1337
# [back in main] i @ 0xc53f18a4 = 3
# [back in main] j @ 0x00601048 = 1337

# Address `0xc53f1844` is a address of local variable j and
# `0x00601048` is a address of global variable j.

# in the following output, GDB is used to stop execution at a breakpoint
# in `func3()`.
# Then backtrace command shows the record of each function call on the stack.
gcc -g scope3.c
gdb -q ./a.out

# (gdb) list 1
# 1	#include <stdio.h>
# 2
# 3	int j = 43;  // j is a global variable.
# 4
# 5	void func3() {
# 6	  int i = 11, j = 999;  // Here, j is a local variable of func3().
# 7	  printf("\t\t\t[in func3] i @ 0x%08x = %d\n", &i, i);
# 8	  printf("\t\t\t[in func3] j @ 0x%08x = %d\n", &j, j);
# 9	}
# 10

# (gdb) break 7
# Breakpoint 1 at 0x4005fb: file scope3.c, line 7.

# (gdb) run
# Starting program: /home/daehakim/Desktop/Research/hacking/0x200_Programming/a.out
# [in main] i @ 0xffffe294 = 3
# [in main] j @ 0x00601048 = 43
# 	[in func1] i @ 0xffffe274 = 5
# 	[in func1] j @ 0x00601048 = 43
# 		[in func2] i @ 0xffffe254 = 7
# 		[in func2] j @ 0x00601048 = 43
# 		[in func2] setting j = 1337

# Breakpoint 1, func3 () at scope3.c:7
# 7	  printf("\t\t\t[in func3] i @ 0x%08x = %d\n", &i, i);

# (gdb) bt
# #0  func3 () at scope3.c:7
# #1  0x00000000004006b5 in func2 () at scope3.c:17
# #2  0x000000000040075e in func1 () at scope3.c:26
# #3  0x0000000000400807 in main () at scope3.c:35

# Each time a function is called, a record called `stack frame`
# is put on the stack.
# The local variables contained in each stack frame can be shown in GDB
# by adding the word `full` to the backtrace command.

# (gdb) bt full
# #0  func3 () at scope3.c:7
#         i = 11
#         j = 999
# #1  0x00000000004006b5 in func2 () at scope3.c:17
#         i = 7
# #2  0x000000000040075e in func1 () at scope3.c:26
#         i = 5
# #3  0x0000000000400807 in main () at scope3.c:35
#         i = 3

# The full backtrace clearly shows that the local variable `j` only
# exists in `func3()`'s context.
# The global version of the variable `j` is used in the other function's contexts.

# Similar to global variables, a `static variable remains intact btw.
# function calls.
# One different feature of static variables is they are only initialized once.

gcc -o static static.c
./static
# [in main] static_var = 1337
# 	[in function] var = 5
# 	[in function] static_var = 5
# [in main] static_var = 1337
# 	[in function] var = 5
# 	[in function] static_var = 6
# [in main] static_var = 1337
# 	[in function] var = 5
# 	[in function] static_var = 7
# [in main] static_var = 1337
# 	[in function] var = 5
# 	[in function] static_var = 8
# [in main] static_var = 1337
# 	[in function] var = 5
# 	[in function] static_var = 9

# The `static_var` retains it's value btw. subsequent calls
# to `function()`.
# This is because static variables retain their values, 
# but also because they are only initialized once.

# And printing the addresses of these variables will provide greater
# viability into what's really going on.

gcc -o static2.c
./static2
# [in main] static_var @ 0x601044 = 1337
# 	[in function] var @ 0x7fff5d526674 = 5
# 	[in function] static_var @ 0x601040 = 5
# [in main] static_var @ 0x601044 = 1337
# 	[in function] var @ 0x7fff5d526674 = 5
# 	[in function] static_var @ 0x601040 = 6
# [in main] static_var @ 0x601044 = 1337
# 	[in function] var @ 0x7fff5d526674 = 5
# 	[in function] static_var @ 0x601040 = 7
# [in main] static_var @ 0x601044 = 1337
# 	[in function] var @ 0x7fff5d526674 = 5
# 	[in function] static_var @ 0x601040 = 8
# [in main] static_var @ 0x601044 = 1337
# 	[in function] var @ 0x7fff5d526674 = 5
# 	[in function] static_var @ 0x601040 = 9

# With the addresses of the variables displayed, it is apparent
# that the `static_var` in `main()` is different than the one
# found in `function()`.
