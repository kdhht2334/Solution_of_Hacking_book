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
