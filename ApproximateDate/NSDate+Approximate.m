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
    if(interval >= 0.0f && interval <= 5.0f) {
        return @"Just moments ago.";
    } else {
        return [NSString stringWithFormat:@"%i seconds ago.", (int) interval];
    }
}

@end