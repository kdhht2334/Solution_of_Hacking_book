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
