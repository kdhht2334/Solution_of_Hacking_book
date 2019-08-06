# 0x510 Assembly vs. C

# The shellcode bytes are actually architecture-specific machine instructions,
# so shellcode is written using the assembly language.

# In C, standard libraries are used for convenience and portability.

# By definition, assembly language is already specific to a certain processor
# architecture, so portability is impossible.

# To begin our comparison, let's write a simple C program, then rewrite it in
# x86 assembly.

$ gcc -o helloworld helloworld.c
$ strace ./helloworld

# The strace program is used to trace a program’s system calls. Used on the compiled
# helloworld program, it shows every system call that program makes.

#execve("./01_helloworld", ["./01_helloworld"], [/* 34 vars */]) = 0
#brk(NULL)                               = 0x1200000
#access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
#access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
#open("tls/x86_64/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
#open("tls/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
#open("x86_64/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
#open("libc.so.6", O_RDONLY|O_CLOEXEC)   = -1 ENOENT (No such file or directory)
#open("/usr/local/cuda/lib64/tls/x86_64/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
#stat("/usr/local/cuda/lib64/tls/x86_64", 0x7ffd00139070) = -1 ENOENT (No such file or directory)
#open("/usr/local/cuda/lib64/tls/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
#stat("/usr/local/cuda/lib64/tls", 0x7ffd00139070) = -1 ENOENT (No such file or directory)
#open("/usr/local/cuda/lib64/x86_64/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
#stat("/usr/local/cuda/lib64/x86_64", 0x7ffd00139070) = -1 ENOENT (No such file or directory)
#open("/usr/local/cuda/lib64/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
#stat("/usr/local/cuda/lib64", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
#open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
#fstat(3, {st_mode=S_IFREG|0644, st_size=137269, ...}) = 0
#mmap(NULL, 137269, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f12b050b000
#close(3)                                = 0
#access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
#open("/lib/x86_64-linux-gnu/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
#read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0P\t\2\0\0\0\0\0"..., 832) = 832
#fstat(3, {st_mode=S_IFREG|0755, st_size=1868984, ...}) = 0
#mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f12b050a000
#mmap(NULL, 3971488, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f12aff3e000
#mprotect(0x7f12b00fe000, 2097152, PROT_NONE) = 0
#mmap(0x7f12b02fe000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1c0000) = 0x7f12b02fe000
#mmap(0x7f12b0304000, 14752, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f12b0304000
#close(3)                                = 0
#mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f12b0509000
#mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f12b0508000
#arch_prctl(ARCH_SET_FS, 0x7f12b0509700) = 0
#mprotect(0x7f12b02fe000, 16384, PROT_READ) = 0
#mprotect(0x600000, 4096, PROT_READ)     = 0
#mprotect(0x7f12b052d000, 4096, PROT_READ) = 0
#munmap(0x7f12b050b000, 137269)          = 0
#fstat(1, {st_mode=S_IFCHR|0620, st_rdev=makedev(136, 4), ...}) = 0
#brk(NULL)                               = 0x1200000
#brk(0x1221000)                          = 0x1221000
#write(1, "Hello, world!\n", 14Hello, world!
#)         = 14
#exit_group(0)                           = ?
#+++ exited with 0 +++
