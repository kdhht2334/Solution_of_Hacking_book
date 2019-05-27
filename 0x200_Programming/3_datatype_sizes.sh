# 0x262 Signed, Unsigned, Long, and Short

# By default, numerical values in C are signed, which means 
# they can be both positive and negative.

# Since it's all just memory in the end, all numerical values 
# must be stored in binary, and unsigned values make the
# most sense in binary.

# When adding a positive value and a negative value, the 
# negative value is converted to a binary positive value, 
# then, inverting all the bits, and the addition process 
# is performed.

# The language of C provides a macro called `sizeof()` 
# that can determine the size of certain data types.
gcc datatype_sizes.c
./a.out

# The 'int' datatype is		 4 bytes
# The 'unsigned int' datatype is		 4 bytes
# The 'short int' datatype is		 2 bytes
# The 'long int' datatype is		 8 bytes
# The 'long long int' datatype is		 8 bytes
# The 'float' datatype is		 4 bytes
# The 'char' datatype is		 1 bytes

# Both signed and unsigned integers are four bytes
# in size on the x86 architecture.

# The `long` and `short` keywords can also be used with
# floating-point variables to extend and shorten their size.
