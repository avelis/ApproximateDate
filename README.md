# Approximate Date

A NSDate category extension used to help create approximate string output according to the date passed in.

1. If the difference between two dates is less than 5 seconds, approximate return “Just moments ago.”
* If less than a minute it return “X seconds ago.”
* If less than an hour, it return “X minutes ago.”

### Example:
    #import "NSDate+Approximate.h"
    ...
    NSDate *now = [NSDate date];
    //Variable approximate equals "Just moments ago".
    NSString *approximate = [now approximate:dateLessThanFiveSecondsAgo];
