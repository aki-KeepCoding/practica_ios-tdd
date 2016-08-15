//
//  Money.m
//  TheWallet
//
//  Created by Akixe on 14/8/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import "Money.h"
#import "Money-Private.h"
#import "Dollar.h"
#import "Euro.h"

@implementation Money

+ (id) euroWithAmount: (NSInteger) amount
{
    return [[Euro alloc] initWithAmount:amount];
}

+ (id) dollarWithAmount: (NSInteger) amount
{
    return [[Dollar alloc] initWithAmount:amount];
}

- (id) initWithAmount: (NSInteger) amount
{
    if (self = [super init]) {
        _amount = @(amount);
    }
    return self;
}

- (id) times:(NSInteger)multiplier
{
    return [[Money alloc] initWithAmount:[[self amount] integerValue] * multiplier];
}


#pragma - overriden
- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@%ld>", [self class], (long)[self amount]];
}

- (BOOL) isEqual:(id)object
{
    return [self amount] == [object amount];
}

- (NSUInteger) hash
{
    return (NSUInteger) [self amount];
}

@end
