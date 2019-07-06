# 0x266 Command-Line Arguments

gcc -o commandline commandline.c

./commandline
# There were 1 arguments provided:
# argument #0	-	./commandline

./commandline Hello everyone in the earth!
# There were 6 arguments provided:
# argument #0	-	./commandline
# argument #1	-	Hello
# argument #2	-	everyone
# argument #3	-	in
# argument #4	-	the
# argument #5	-	earth!

# Sometimes a program will want to use a command-line argument 
# as an integer as opposed to a string.
# `atoi()` which is short for ASCII to integer can be a solution.

gcc convert.c
./a.out
# Usage: ./a.out <message> <# of times to repeat>
./a.out 'Hello, world!' 5
# Repeating 5 times..
#   0 - Hello, world!
#   1 - Hello, world!
#   2 - Hello, world!
#   3 - Hello, world!
#   4 - Hello, world!

# In C, it's important to check for these types of conditions
# and handle them in program logic.
# If the error-checking `if` statement is commented out, 
# this memory violation can be explored.

gcc convert2.c
./a.out test
# Segmentation fault (core dumped)

# When the program isn't given enough command-line arguments, 
# it still tries to access elements of the argument array, 
# even though they don't exist.
# This results in the program crashing due to a segmentation fault.

# When the program attempts to access an address that is out of bounds,
# it will crash and die in what's called a `segmentation fault`.

# Let's check further details with GDB.
gcc -g convert2.c
gdb -q ./a.out

# (gdb) run test
# Starting program: /home/daehakim/Desktop/Research/hacking/a.out test
# Program received signal SIGSEGV, Segmentation fault.
# __GI_____strtol_l_internae (nptr=0x0, endptr=endptr@entry=0x0, base=base@entry=10, group=group@entry=0,
#     loc=0x7ffff7dd2420 <_nl_global_locale>) at ../stdlib/strtol_l.c:293
# 293	../stdlib/strtol_l.c: No such file or directory.

# (gdb) where
# #0  __GI_____strtol_l_internal (nptr=0x0, endptr=endptr@entry=0x0, base=base@entry=10, group=group@entry=0,
#     loc=0x7ffff7dd2420 <_nl_global_locale>) at ../stdlib/strtol_l.c:293
# #1  0x00007ffff7a483d2 in __strtol (nptr=<optimized out>, endptr=endptr@entry=0x0, base=base@entry=10)
#     at ../stdlib/strtol.c:106
# #2  0x00007ffff7a43e90 in atoi (nptr=<optimized out>) at atoi.c:27
# #3  0x0000000000400609 in main (argc=2, argv=0x7fffffffe3b8) at convert2.c:13

# (gdb) break main
# Breakpoint 1 at 0x4005f1: file convert2.c, line 13.

# (gdb) run test
# The program being debugged has been started already.
# Start it from the beginning? (y or n) y
# Starting program: /home/daehakim/Desktop/Research/hacking/a.out test

# Breakpoint 1, main (argc=2, argv=0x7fffffffe3b8) at convert2.c:13
# 13    count = atoi(argv[2]);  // Convert the 2nd argument into an integer.

# (gdb) cont
# Continuing.

# Program received signal SIGSEGV, Segmentation fault.
# __GI_____strtol_l_internal (nptr=0x0, endptr=endptr@entry=0x0, base=base@entry=10, group=group@entry=0,
#     loc=0x7ffff7dd2420 <_nl_global_locale>) at ../stdlib/strtol_l.c:293
#     293 ../stdlib/strtol_l.c: No such file or directory.

# (gdb) x/3xw 0x7fffffffe3b8
# 0x7fffffffe3b8: 0xffffe631  0x00007fff  0xffffe65f

# (gdb) x/s 0x00007fff
# 0x00007fff:         "test"
