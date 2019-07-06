# 0x285 Function Pointers

# A `pointer` simply contains a memory address and is given a data type
#  that describes where it points.

# Usually, pointers are used for variables. However, they can also be 
# used for functions.

# Here is an example (100 page).
gcc -o funcptr_example funcptr_example.c
./funcptr_example
# function_ptr is 0x004a1e50
# This is function one
# value returned was 1
# function_ptr is 0x004a1e80
# This is function two
# value returned was 2


# 0x286 Pseudo-random Numbers

# Since computers are deterministic machines, it is impossible for them 
# to produce truly random numbers.

# The pseudo-random number generator functions fill this need by generating
# a stream of numbers that is `pseudo-random`.

# Here is an example (101 page).
gcc -o rand_example rand_example.c
./rand_example
# RAND_MAX is 2147483647
# random values from 0 to RAND_MAX
# 259617634
# 1854287581
# 728688603
# 2117595427
# 179859858
# 1395142077
# 1926430193
# 2048791579
# random values from 1 to 20
# 16
# 8
# 1
# 14
# 8
# 10
# 6
# 18

