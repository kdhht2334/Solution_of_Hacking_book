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

./heap_example 100
#	[+] allocating 100 bytes of memory on the heap for char_ptr
#char_ptr (0x7fe824c02a90) --> 'This is memory is located on the heap.'
#	[+] allocating 12 bytes of memory on the heap for int_ptr
#int_ptr (0x7fe824c00670) --> 31337
#	[-] freeing char_ptr's heap memory...
#	[+] allocating another 15 bytes for char_ptr
#char_ptr (0x7fe824c00680) --> 'new memory'
#	[-] freeing int_ptr's heap memory...
#	[-] freeing char_ptr's heap memory...

gcc -o errorchecked_heap errorchecked_heap.c
./errorchecked_heap 16

#	[+] allocating 16 bytes of memory on the heap for char_ptr
#char_ptr (0x7fda23c00670) ==> 'This is memory is located on the heap.'
#	[+] allocating 12 bytes of memory on the heap for int_ptr
#errorchecked_heap(29192,0x1115235c0) malloc: Incorrect checksum for freed object 0x7fda23c00688: probably modified after being freed.
#Corrupt value: 0x656874206e6f2064
#errorchecked_heap(29192,0x1115235c0) malloc: *** set a breakpoint in malloc_error_break to debug
#Abort trap: 6

./errorchecked_heap 17
#	[+] allocating 17 bytes of memory on the heap for char_ptr
#char_ptr (0x7fc631400620) ==> 'This is memory is located on the heap.'
#	[+] allocating 12 bytes of memory on the heap for int_ptr
#int_ptr (0x7fc631400670) ==> 31337
#	[-] freeing char_ptr's heap memory...
#	[+] allocating another 15 bytes for char_ptr
#char_ptr (0x7fc631400680) ==> 'new memory'
#	[-] freeing int_ptr's heap memory...
#	[-] freeing char_ptr's heap memory...

./errorchecked_heap 25
#	[+] allocating 25 bytes of memory on the heap for char_ptr
#char_ptr (0x7f8580c00620) ==> 'This is memory is located on the heap.'
#	[+] allocating 12 bytes of memory on the heap for int_ptr
#int_ptr (0x7f8580c00670) ==> 31337
#	[-] freeing char_ptr's heap memory...
#	[+] allocating another 15 bytes for char_ptr
#char_ptr (0x7f8580c00680) ==> 'new memory'
#	[-] freeing int_ptr's heap memory...
#	[-] freeing char_ptr's heap memory...
