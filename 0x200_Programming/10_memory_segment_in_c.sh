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


# 0x272 Using the Heap 
# Allocating memory in the heap is done using the `malloc()` function.

gcc -o heap_example heap_example.c
./heap_example

#  [+] allocating 50 bytes of memory on the heap for char_ptr
#char_ptr (0x7fbf55402ab0) --> 'This is memory is located on the heap.'
#	[+] allocating 12 bytes of memory on the heap for int_ptr
#int_ptr (0x7fbf55400690) --> 31337
#	[-] freeing char_ptr's heap memory...
#	[+] allocating another 15 bytes for char_ptr
#char_ptr (0x7fbf554006a0) --> 'new memory'
#	[-] freeing int_ptr's heap memory...
#	[-] freeing char_ptr's heap memory...
