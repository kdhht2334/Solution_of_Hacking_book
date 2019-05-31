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

