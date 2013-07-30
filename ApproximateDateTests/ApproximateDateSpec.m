//
//  ApproximateDateSpec.m
//  ApproximateDate
//
//  Created by Andrew Velis on 7/29/13.
//  Copyright (c) 2013 Andrew Velis. All rights reserved.
//

#import "Kiwi.h"
#import "ApproximateDate.h"

SPEC_BEGIN(ApproximateDateSpec)

/*
    Write a Facebook-style method that returns time qualitatively.
    Given an ApproximateDate instance
    When compared to a date
        And the difference between two date's is less than 5 seconds,
            it should return “Just moments ago.”
        And the difference between two date's is less than a minute,
            it should return “X seconds ago.”
        And the difference between two date's is less than an hour,
            it should return “X minutes ago.”
 */

describe(@"Given an ApproximateDate instance", ^{
    __block ApproximateDate *systemUnderTest = nil;

    beforeEach(^{ // Occurs before each enclosed "it"
        systemUnderTest = [[ApproximateDate alloc] init];
    });

    specify(^{
        [systemUnderTest shouldNotBeNil];
    });

    context(@"when approximating a date", ^{

        context(@"and the date difference is less than 5 seconds", ^{

            it(@"should return 'Just moments ago.'", ^{
                [[[systemUnderTest approximate:[NSDate date]] should] equal:@"Just moments ago."];
            });

        });
    });
});

SPEC_END