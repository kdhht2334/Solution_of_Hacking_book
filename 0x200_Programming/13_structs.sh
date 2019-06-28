# 0x284 Structs

# In C, `structs` are variables that can contain many other variables.
# When dealing with many time functions, these functions use a time
# struct called `tm`, which is defined in `/usr/include/time.h`.
# The struct's definition is as follows.


# struct tm {
#     int        tm_sec;        /* seconds */
#     int        tm_min;        /* minutes */
#     int        tm_hour;       /* hours */
#     int        tm_mday;       /* day of the month */
#     int        tm_mon;        /* month */
#     int        tm_year;       /* year */
#     int        tm_wday;       /* day of the week */
#     int        tm_yday;       /* day in the year */
#     int        tm_isdst;      /* daylight saving time */

# After this struct is defined, `struct tm` becomes a usable variable type, 
# which can be used to declare variables and pointers with the data type of 
# the `tm` struct.

gcc -o time_example time_example.c
./time_example
# time() - seconds since epoch: 1561645971
# Current time is: 23:32:51

./time_example
# time() - seconds since epoch: 1561645976
# Current time is: 23:32:56

gcc -o time_example2 time_example2.c
./time_example2
# time() - seconds since epoch: 1561731878
# Current time is: 23:24:38
# bytes of struct located at 0xe67b3578
# 26 00 00 00 18 00 00 00 17 00 00 00 1c 00 00 00
# 05 00 00 00 77 00 00 00 05 00 00 00 b2 00 00 00
# 00 00 00 00 00 00 00 00 90 7e 00 00 00 00 00 00
# 4c 62 80 41 c0 7f 00 00
# int_ptr @ 0xe67b3578: 38
# int_ptr @ 0xe67b357c: 24
# int_ptr @ 0xe67b3580: 23
