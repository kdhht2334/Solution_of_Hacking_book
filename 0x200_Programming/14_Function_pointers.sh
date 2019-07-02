# 0x285 Function Pointers

# A `pointer` simply contains a memory address and is given a data type
#  that describes where it points.

# Usually, pointers are used for variables. However, they can also be 
# used for functions.

# Here is example (100 page).
gcc -o funcptr_example funcptr_example.c
./funcptr_example
# function_ptr is 0x004a1e50
# This is function one
# value returned was 1
# function_ptr is 0x004a1e80
# This is function two
# value returned was 2
