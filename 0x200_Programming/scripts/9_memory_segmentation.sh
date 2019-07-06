# 0x270 Memory Segmentation

# A compiled program's memory is divided into 5 segments:
# test, data, bss, heap, and stack.
# Each segment represents a special portion of memory 
# that is set aside for a certain purpose.
gcc -g stack_example.c
gdb -q ./a.out

# (gdb) disass main
# Dump of assembler code for function main:
#    0x000000000040058b <+0>:	push   %rbp
#    0x000000000040058c <+1>:	mov    %rsp,%rbp
#    0x000000000040058f <+4>:	mov    $0x4,%ecx    # 4
#    0x0000000000400594 <+9>:	mov    $0x3,%edx    # 3
#    0x0000000000400599 <+14>:	mov    $0x2,%esi  # 2
#    0x000000000040059e <+19>:	mov    $0x1,%edi  # 1
#    0x00000000004005a3 <+24>:	callq  0x400546 <test_function>
#    0x00000000004005a8 <+29>:	mov    $0x0,%eax
#    0x00000000004005ad <+34>:	pop    %rbp
#    0x00000000004005ae <+35>:	retq
# End of assembler dump.

# The arguments for the function are 1, 2, 3, and 4, so the 
# subsequent push instructions push 4, 3, 2, and 1 on the stack.

# (gdb) disass test_function
# Dump of assembler code for function test_function:
#    0x0000000000400546 <+0>:	push   %rbp
#    0x0000000000400547 <+1>:	mov    %rsp,%rbp
#    0x000000000040054a <+4>:	sub    $0x40,%rsp
#    0x000000000040054e <+8>:	mov    %edi,-0x34(%rbp)
#    0x0000000000400551 <+11>:	mov    %esi,-0x38(%rbp)
#    0x0000000000400554 <+14>:	mov    %edx,-0x3c(%rbp)
#    0x0000000000400557 <+17>:	mov    %ecx,-0x40(%rbp)
#    0x000000000040055a <+20>:	mov    %fs:0x28,%rax
#    0x0000000000400563 <+29>:	mov    %rax,-0x8(%rbp)
#    0x0000000000400567 <+33>:	xor    %eax,%eax
#    0x0000000000400569 <+35>:	movl   $0x7a69,-0x24(%rbp)
#    0x0000000000400570 <+42>:	movb   $0x41,-0x20(%rbp)
#    0x0000000000400574 <+46>:	nop
#    0x0000000000400575 <+47>:	mov    -0x8(%rbp),%rax
#    0x0000000000400579 <+51>:	xor    %fs:0x28,%rax
#    0x0000000000400582 <+60>:	je     0x400589 <test_function+67>
#    0x0000000000400584 <+62>:	callq  0x400420 <__stack_chk_fail@plt>
#    0x0000000000400589 <+67>:	leaveq
#    0x000000000040058a <+68>:	retq
# End of assembler dump.

# When the `test_function` is called from the `main` function, 
# the various values are pushed to the stack to create the start 
# of the stack frame.

# (gdb) list main
# 4
# 5	  flag = 31337;
# 6	  buffer[0] = 'A';
# 7	}
# 8
# 9	int main() {
# 10	  test_function(1, 2, 3, 4);
# 11	}

# (gdb) break 10
# Breakpoint 1 at 0x40058f: file stack_example.c, line 10.
# (gdb) break test_function
# Breakpoint 2 at 0x40055a: file stack_example.c, line 1.

# (gdb) run
# Starting program: /home/daehakim/Desktop/Research/hacking/0x200_Programming/a.out

# Breakpoint 1, main () at stack_example.c:10
# 10	  test_function(1, 2, 3, 4);

# (gdb) i r rsp rbp rip
# rsp            0x7fffffffe290	0x7fffffffe290
# rbp            0x7fffffffe290	0x7fffffffe290
# rip            0x40058f	0x40058f <main+4>

# (gdb) x/5i $rip
# => 0x40058f <main+4>:	mov    $0x4,%ecx    # 4
#    0x400594 <main+9>:	mov    $0x3,%edx    # 3
#    0x400599 <main+14>:	mov    $0x2,%esi  # 2
#    0x40059e <main+19>:	mov    $0x1,%edi  # 1
#    0x4005a3 <main+24>:	callq  0x400546 <test_function>

# (gdb) cont
# Continuing.

# Breakpoint 2, test_function (a=1, b=2, c=3, d=4) at stack_example.c:1
# 1	void test_function(int a, int b, int c, int d) {

# (gdb) i r rsp rbp rip
# rsp            0x7fffffffe240	0x7fffffffe240
# rbp            0x7fffffffe280	0x7fffffffe280
# rip            0x40055a	0x40055a <test_function+20>

# (gdb) disass test_function
# Dump of assembler code for function test_function:
#    0x0000000000400546 <+0>:	push   %rbp
#    0x0000000000400547 <+1>:	mov    %rsp,%rbp
#    0x000000000040054a <+4>:	sub    $0x40,%rsp         ** Important !! **
#    0x000000000040054e <+8>:	mov    %edi,-0x34(%rbp)   *** move 1
#    0x0000000000400551 <+11>:	mov    %esi,-0x38(%rbp) *** move 2
#    0x0000000000400554 <+14>:	mov    %edx,-0x3c(%rbp) *** move 3
#    0x0000000000400557 <+17>:	mov    %ecx,-0x40(%rbp) *** move 4
# => 0x000000000040055a <+20>:	mov    %fs:0x28,%rax    ******************
#    0x0000000000400563 <+29>:	mov    %rax,-0x8(%rbp)
#    0x0000000000400567 <+33>:	xor    %eax,%eax
#    0x0000000000400569 <+35>:	movl   $0x7a69,-0x24(%rbp)
#    0x0000000000400570 <+42>:	movb   $0x41,-0x20(%rbp)
#    0x0000000000400574 <+46>:	nop
#    0x0000000000400575 <+47>:	mov    -0x8(%rbp),%rax
#    0x0000000000400579 <+51>:	xor    %fs:0x28,%rax
#    0x0000000000400582 <+60>:	je     0x400589 <test_function+67>
#    0x0000000000400584 <+62>:	callq  0x400420 <__stack_chk_fail@plt>
#    0x0000000000400589 <+67>:	leaveq
#    0x000000000040058a <+68>:	retq
# End of assembler dump.

# (gdb) x/16xw $rsp
# 0x7fffffffe240:	0x00000004	0x00000003	0x00000002	0x00000001
# 0x7fffffffe250:	0x00000001	0x00000000	0x004005fd	0x00000000
# 0x7fffffffe260:	0x00000000	0x00000000	0x00000000	0x00000000
# 0x7fffffffe270:	0x004005b0	0x00000000	0x00400450	0x00000000

# Say something..!

# (gdb) print $edi
# $12 = 1
# (gdb) print $esi
# $13 = 2
# (gdb) print $edx
# $14 = 3
# (gdb) print $ecx
# $15 = 4
