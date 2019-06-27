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
