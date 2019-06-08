# 0x271 Memory Segments in C

# (Additional explanation)

gcc -o memory_segment memory_segment.c
./memory_segment
# global_initialized_var is at address 0x00601048
# static_initialized_var is at address 0x0060104c

# static_var is at address 0x00601054
# global_var is at address 0x00601058

# heap_var is at address 0x0200e010

# stack_var is at address 0x5974201c
# The function's stack_var is at address 0x59741ff4

