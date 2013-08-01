//
//  ApproximateDateSpec.m
//  ApproximateDate
//
//  Created by Andrew Velis on 7/29/13.
//  Copyright (c) 2013 Andrew Velis. All rights reserved.
//

#import "Kiwi.h"
#import "NSDate+Approximate.h"


SPEC_BEGIN(ApproximateDateSpec)

/*
 Write a Facebook-style method that returns time qualitatively.
 ApproximateDate
    When compared to a date
        And the difference between two date's is less than 5 seconds,
            it should return “Just moments ago.”
        And the difference between two date's is less than a minute,
            it should return “X seconds ago.”
        And the difference between two date's is less than an hour,
            it should return “X minutes ago.”
 */

describe(@"ApproximateDate", ^{
    __block NSDate *systemUnderTest = nil;
    __block NSDate *date = nil;


    context(@"when approximating time", ^{

        context(@"with a time difference less than 5 seconds", ^{

            it(@"should return 'Just moments ago.'", ^{
                date = [NSDate date];
                systemUnderTest = [NSDate date];
                NSString *value = [systemUnderTest approximate:date];
                [[value should] containString:@"Just moments ago." options:NSCaseInsensitiveSearch];
            });

        });

        context(@"with a time difference less than a minute", ^{

            it(@"should return '(n) seconds ago.'", ^{
                date = [[NSDate date] dateByAddingTimeInterval:-15.0];
                systemUnderTest = [NSDate date];
                NSString *value = [systemUnderTest approximate:date];
                [[value should] matchPattern:@"([0-9]+) seconds ago." options:NSRegularExpressionCaseInsensitive];
            });
        });

        context(@"with a time difference less than an hour", ^{

            it(@"should return '(n) minutes ago.'", ^{
                date = [[NSDate date] dateByAddingTimeInterval:-(15.0 * 60)];
                systemUnderTest = [NSDate date];
                NSString *value = [systemUnderTest approximate:date];
                [[value should] matchPattern:@"([0-9]+) minutes ago." options:NSRegularExpressionCaseInsensitive];
            });
        });

        context(@"with a time difference more than an hour", ^{

            it(@"should return 'Awhile ago.'", ^{
                date = [[NSDate date] dateByAddingTimeInterval:-(100.0 * 60)];
                systemUnderTest = [NSDate date];
                NSString *value = [systemUnderTest approximate:date];
                [[value should] matchPattern:@"Awhile ago." options:NSRegularExpressionCaseInsensitive];
            });
        });

    });
});

SPEC_END