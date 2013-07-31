//
// Created by Andrew Velis on 7/30/13.
// Copyright (c) 2013 Andrew Velis. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSDate+Approximate.h"


@implementation NSDate (Approximate)

- (NSString *)approximate:(NSDate *)date {
    NSTimeInterval interval = [self timeIntervalSinceDate:date];
    interval = floor(interval);
    NSString *approximate;
    if(interval >= 0.0f && interval <= 5.0f) {
        approximate = @"Just moments ago.";
    } else if(interval >= 5.0f && interval <= 60.0f) {
        approximate = [NSString stringWithFormat:@"%i seconds ago.", (int) interval];
    } else {
        approximate = [NSString stringWithFormat:@"%i minutes ago.", (int) floor(interval / 60)];
    }

    return approximate;
}

@end