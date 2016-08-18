//
//  Money.m
//  TheWallet
//
//  Created by Akixe on 14/8/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import "Money.h"

@interface Money()
@property (nonatomic, strong) NSNumber *amount;
@end


@implementation Money

+ (id) euroWithAmount: (NSInteger) amount
{
    return [[Money alloc] initWithAmount:amount currency:@"EUR"];
}

+ (id) dollarWithAmount: (NSInteger) amount
{
    return [[Money alloc] initWithAmount:amount currency:@"USD"];
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

- (Money *) plus: (Money *) other
{
    NSInteger total = [self.amount integerValue] + [other.amount integerValue];
    return [[Money alloc] initWithAmount:total currency:self.currency];
}


#pragma - overriden
- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %@ %@>", [self class], self.currency, self.amount];
}

- (BOOL) isEqual:(id)object
{
    if ([[self currency] isEqual:[object currency]] ) {
        return [self amount] == [object amount];
    } else {
        return NO;
    }
    
}

- (NSUInteger) hash
{
    return [self.amount integerValue];
}

@end
