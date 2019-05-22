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
# (gdb) info register rbp
# rbp            0x7fffffffe2d0	0x7fffffffe2d0

# (gdb) info register eax
# eax            0x400526	4195622


