# TO compile c code
gcc firstprog.c

# Check compiled file
ls -l a.out

# Execute!
./a.out

# Using `objdump`, we can check compiled binaries.
objdump -D a.out | grep -A 20 main.

# And then, we can see like this...
# 100000f5a:	0f 8d 1d 00 00 00 	jge	29 <_main+0x3d>
# 100000f60:	48 8d 3d 3f 00 00 00 	leaq	63(%rip), %rdi
# 100000f67:	e8 1a 00 00 00 	callq	26 <dyld_stub_binder+0x100000f86>
# 100000f6c:	89 45 f4 	movl	%eax, -12(%rbp)
# 100000f6f:	8b 45 f8 	movl	-8(%rbp), %eax
# 100000f72:	83 c0 01 	addl	$1, %eax
# 100000f75:	89 45 f8 	movl	%eax, -8(%rbp)
# 100000f78:	e9 d9 ff ff ff 	jmp	-39 <_main+0x16>
# 100000f7d:	31 c0 	xorl	%eax, %eax
# 100000f7f:	48 83 c4 10 	addq	$16, %rsp
# 100000f83:	5d 	popq	%rbp
# 100000f84:	c3 	retq

# We can compile source code using GDB that is GNU development tools
gdb -q ./a.out

# (gdb) break main
# (gdb) run
# Starting program: /home/.../a.out

# Change GDB start up setting
gdb -q
# (gdb) set dis intel
# (gdb) quit
echo "set dis intel" > ~/.gdbinit
cat ~/.gdbinit

# `-g` flag can be used by the GCG compiler to include extra debugging information
gcc -g firstprog.c
ls -l a.out
# -rwxr-xr-x  1 daehakim  staff   8.5K May 22 17:12 a.out*
gdb -q ./a.out

# (gdb) list
# 1	#include <stdio.h>
# 2
# 3	int main()
# 4	{
# 5	  int i;
# 6	  for (i=0; i<10; i++)
# 7	  {
# 8	    puts("Hello World!\n");
# 9	  }
# 10	  return 0;

# (gdb) disassemble main
# Dump of assembler code for function main:
#    0x0000000000400526 <+0>:	push   %rbp
#    0x0000000000400527 <+1>:	mov    %rsp,%rbp
#    0x000000000040052a <+4>:	sub    $0x10,%rsp
#    0x000000000040052e <+8>:	movl   $0x0,-0x4(%rbp)
#    0x0000000000400535 <+15>:	jmp    0x400545 <main+31>
#    0x0000000000400537 <+17>:	mov    $0x4005e4,%edi
#    0x000000000040053c <+22>:	callq  0x400400 <puts@plt>
#    0x0000000000400541 <+27>:	addl   $0x1,-0x4(%rbp)
#    0x0000000000400545 <+31>:	cmpl   $0x9,-0x4(%rbp)
#    0x0000000000400549 <+35>:	jle    0x400537 <main+17>
#    0x000000000040054b <+37>:	mov    $0x0,%eax
#    0x0000000000400550 <+42>:	leaveq
#    0x0000000000400551 <+43>:	retq

# We can check register information like below:
# (gdb) break main
# (gdb) run
# (gdb) info registers
# rax            0x400526	4195622
# rbx            0x0	0
# rcx            0x0	0
# rdx            0x7fffffffe3c8	140737488348104
# rsi            0x7fffffffe3b8	140737488348088
# rdi            0x1	1
# rbp            0x7fffffffe2d0	0x7fffffffe2d0
# rsp            0x7fffffffe2c0	0x7fffffffe2c0
# r8             0x4005d0	4195792
# r9             0x7ffff7de7ab0	140737351940784
# r10            0x846	2118
# r11            0x7ffff7a2d740	140737348032320
# r12            0x400430	4195376
# r13            0x7fffffffe3b0	140737488348080
# r14            0x0	0
# r15            0x0	0
# rip            0x40052e	0x40052e <main+8>
# eflags         0x206	[ PF IF ]
# cs             0x33	51
# ---Type <return> to continue, or q <return> to quit---
# ss             0x2b	43
# ds             0x0	0
# es             0x0	0
# fs             0x0	0
# gs             0x0	0

# To examine memory, GDB debugger provides command `x`, which is short for examine

# o: Display in octal.
# x: Display in hexadecimal.
# u: Display in unsigned, standard base-10 decimal.
# t: Display in binary.

# (gdb) x/o 0x7fffffffe2d0
# 0x7fffffffe2d0:	020002540
# (gdb) x/x 0x7fffffffe2d0
# 0x7fffffffe2d0:	0x00400560
# (gdb) x/u 0x7fffffffe2d0
# 0x7fffffffe2d0:	4195680
# (gdb) x/t 0x7fffffffe2d0
# 0x7fffffffe2d0:	00000000010000000000010101100000


# (gdb) print $rbp
# $4 = (void *) 0x7fffffffe2d0
# (gdb) x/x $4
# 0x7fffffffe2d0:	0x60
# (gdb) x/xw $rbp
# 0x7fffffffe2d0:	0x00400560
# (gdb) x/dw $rbp
# 0x7fffffffe2d0:	4195680
# (gdb) x/x 4195680
# 0x400560 <__libc_csu_init>:	0x56415741

# To move next line
# (gdb) nexti
# (gdb) nexti
# 0x0000000000400549	6	  for (i=0; i<10; i++)
# (gdb) nexti
# 8	    puts("Hello World!\n");
