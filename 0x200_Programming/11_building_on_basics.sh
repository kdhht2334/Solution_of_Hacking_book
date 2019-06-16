# 0x280 Building on Basics

# 0x281 File Access
# There are two primary ways to access files in C: file descriptors and filestreams. 
# File descriptors use a set of low-level I/O functions, and filestreams are a higher-level form of buffered I/O that is built on the lower-level functions.

# (Something blablabla...)
gcc -o simplenote simmplenote.c
./simplenote
# Usage: ./simplenote <data to add to /tmp/notes>

./simplenote "this is a test note"
# [DEBUG] buffer   @ 0x7fd26dc02a90: 'this is a test note'
# [DEBUG] datafile @ 0x7fd26dc00620: '/tmp/notes'
# [DEBUG] file descriptor is 3
# Note has been saved.

./simplenote "great, it works"
# [DEBUG] buffer   @ 0x7f9826402a90: 'great, it works'
# [DEBUG] datafile @ 0x7f9826400620: '/tmp/notes'
# [DEBUG] file descriptor is 3
# Note has been saved.

cat /tmp/notes
# this is a test note
# great, it works

gcc -o bitwise bitwise.c
./bitwise

# bitwise OR operator   |
# 0 | 0 = 0
# 0 | 1 = 1
# 1 | 0 = 1
# 1 | 1 = 1

# bitwise AND operator   &
# 0 & 0 = 0
# 0 & 1 = 0
# 1 & 0 = 0
# 1 & 1 = 1
