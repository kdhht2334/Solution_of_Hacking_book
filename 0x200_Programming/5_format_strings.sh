# 0x264 Format Strings

# A `format string` is just a character string with special escape sequences
# that tell the function to insert variables printed in a specific format
# in place of the escape sequence.

# Parameter  |  Output Type
# %d         |  Deciman
# %u         |  Unsigned decimal
# %x         |  Hexadecimal

# All of the preceding format parameters receive their data as values,
# not pointers to values. There are also some format parameters
# that expect pointers.

# Parameter  |  Output Type
# %s         |  String
# %n         |  Number of bytes written so far

gcc -o fmt_strings fmt_strings.c
./fmt_strings
# [A] Dec: -73, Hex: ffffffb7, Unsigned: 4294967223
# [B] Dec: 31337, Hex: 7a69, Unsigned: 31337
# [field width on B] 3: '31337', 10: '     31337', '00031337'
# [string] sample  Address e5dfb8b0
# variable A is at address: e5dfb8a8
