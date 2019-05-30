# 0x265 Typecasting

# `Typecasting` is simply a way to temporarily change a variable's data type,
# despite how it was originally defined.
gcc typecasting.c
./a.out

# Even if this value is being stored into a floating-point variable,
# it is impossible to calculate `c` correctly.
# [integers]	 a = 13	 b = 5
# [floats]	 c = 2.000000	 d = 2.600000

gcc pointer_types.c
./a.out

# Format parameter `%p` can show the output memory address.
# Since an integer is 4 bytes, a pointer to the next integer has to be 4 bytes over.
# [integer pointer] points to 0x7ffdd4e3e010, which contains the integer 1
# [integer pointer] points to 0x7ffdd4e3e014, which contains the integer 2
# [integer pointer] points to 0x7ffdd4e3e018, which contains the integer 3
# [integer pointer] points to 0x7ffdd4e3e01c, which contains the integer 4
# [integer pointer] points to 0x7ffdd4e3e020, which contains the integer 5

# Since a char is 1 bytes, a pointer to the next char has to be 1 bytes over.
# [char pointer] points to 0x7ffdd4e3e030, which contains the char  a
# [char pointer] points to 0x7ffdd4e3e031, which contains the char  b
# [char pointer] points to 0x7ffdd4e3e032, which contains the char  c
# [char pointer] points to 0x7ffdd4e3e033, which contains the char  d
# [char pointer] points to 0x7ffdd4e3e034, which contains the char  e

gcc pointer_types3.c
./a.out

# [integer pointer] points to 0x7ffd829ffbf0, which contains the integer a
# [integer pointer] points to 0x7ffd829ffbf1, which contains the integer b
# [integer pointer] points to 0x7ffd829ffbf2, which contains the integer c
# [integer pointer] points to 0x7ffd829ffbf3, which contains the integer d
# [integer pointer] points to 0x7ffd829ffbf4, which contains the integer e
# [char pointer] points to 0x7ffd829ffbf5, which contains the char  1
# [char pointer] points to 0x7ffd829ffbf5, which contains the char  2
# [char pointer] points to 0x7ffd829ffbf5, which contains the char  3
# [char pointer] points to 0x7ffd829ffbf5, which contains the char  4
# [char pointer] points to 0x7ffd829ffbf5, which contains the char  5
