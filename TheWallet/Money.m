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
    return [[Euro alloc] initWithAmount:amount currency:@"EUR"];
}

+ (id) dollarWithAmount: (NSInteger) amount
{
    return [[Dollar alloc] initWithAmount:amount currency:@"USD"];
}

- (id) initWithAmount: (NSInteger) amount currency: (NSString *) currency
{
    if (self = [super init]) {
        _amount = @(amount);
        _currency = currency;
    }
    return self;
}

- (id) times:(NSInteger)multiplier
{
    NSInteger newAmount = [self.amount integerValue] * multiplier;
    return [[Money alloc] initWithAmount: newAmount
                                currency: self.currency];
    
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
