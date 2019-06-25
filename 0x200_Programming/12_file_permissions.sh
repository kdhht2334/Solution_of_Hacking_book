# 0x282 File Permissions

# You can easily check file permission by using `ls -l` command.
ls -l simplenote*

# For /etc/passwd file, the owner is daehakim and the goup is staff.
# -rwxr-xr-x  1 daehakim  staff   8.8K Jun 14 21:28 simplenote*
# -rw-r--r--  1 daehakim  staff   1.6K Jun 14 21:33 simplenote.c

# The first command (`chmod 721`) gives read, write, and execute permissions 
# to the user, because the first number is 7 (4+2+1), write and execute
# permissions to group, becuase the second number is 3 (2+1), and only execute
# permission to other, because the third number is 1.

chmod 731 simplenote.c
ls -l simplenote.c
# -rwx-wx--x  1 daehakim  staff   1.6K Jun 14 21:33 simplenote.c*

# The argument `ugo-wx` means that `Subtract write and execute permission from
# user, group, and other`.
chmod ugo-wx simplenote.c
ls -l simplenote.c
# -r--------  1 daehakim  staff   1.6K Jun 14 21:33 simplenote.c

# And `u+w` gives write permission to user.
chmod u+w simplenote.c
ls -l simplenote.c
# -rw-------  1 daehakim  staff   1.6K Jun 14 21:33 simplenote.c


# 0x283 User IDs

# Every use on a Unix system has a unique user ID number.
# This can be displayed using the `id` command.
id daehakim
# uid=xxx(daehakim) gid=xx(staff) groups=xx(staff) (...) (personal secrete)

id root
# uid=0(root) gid=0(wheel) groups=0(wheel) (...) (personal secrete)

# This example is how the `chsh` program is able to allow any user to change
# his/her login shell stored in `/etc/passwd`.
gcc -o uid_demo uid_demo.c
ls -l uid_demo
# -rwxr-xr-x  1 root  staff   8.3K Jun 25 13:47 uid_demo*

./uid_demo
# Because my user ID is like this: uid=501(daehakim).
# real uid: 501
# effective uid: 501

sudo chown root:wheel ./uid_demo
ls -l uid_demo
# -rwsr-xr-x  1 root  wheel   8.3K Jun 25 13:47 uid_demo*

sudo chmod u+s ./uid_demo
ls -l uid_demo
# -rwsr-xr-x  1 root  staff   8.3K Jun 25 13:47 uid_demo*

./uid_demo

# 0 means that the program can access files as root.
# real uid: 501
# effective uid: 0

# This same technique can be used in a multi-user note-taking program.
# The next example will be a modification of the simplenote program;
# it will also record the user ID of each note's original author.
gcc -o notetaker notetaker.c
sudo chown root:group ./notetaker
sudo chmod u+s ./notetaker
# -rwsr-xr-x  1 root  group   8.9K Jun 25 14:12 ./notetaker*

./notetaker "this is a test of multi-user notes"
# [debug] buffer   @ 0x7f8944c02a90: 'this is a test of multi-user notes'
# [debug] datafile @ 0x7f8944c00620: '/var/notes'
# [DEBUG] file descriptor is 3
# Note has been saved.

ls -l /var/notes
# -rw-------  1 root  wheel    40B Jun 25 14:13 /var/notes

cat /var/notes
# cat: /var/notes: Permission denied
sudo cat /var/notes
# �
# this is a test of multi-user notes

sudo hexdump -C /var/notes
# 00000000  f5 01 00 00 0a 74 68 69  73 20 69 73 20 61 20 74  |.....this is a t|
# 00000010  65 73 74 20 6f 66 20 6d  75 6c 74 69 2d 75 73 65  |est of multi-use|
# 00000020  72 20 6e 6f 74 65 73 0a                           |r notes.|
# 00000028
