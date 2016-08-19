//
//  Money.m
//  TheWallet
//
//  Created by Akixe on 14/8/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import "Money.h"
#import "Broker.h"

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

- (id<Money>) times:(NSInteger)multiplier
{
    NSInteger newAmount = [self.amount integerValue] * multiplier;
    return [[Money alloc] initWithAmount: newAmount
                                currency: self.currency];
    
}

- (id<Money>) plus: (Money *) other
{
    NSInteger total = [self.amount integerValue] + [other.amount integerValue];
    return [[Money alloc] initWithAmount:total currency:self.currency];
}

- (id<Money>) reduceToCurrency:(NSString *)currency withBroker:(Broker *)broker
{
    Money *result;
    double rate = [[broker.rates objectForKey:[broker keyFromCurrency: self.currency
                                                       toCurrency:currency]] doubleValue];
    if ([self.currency isEqual:currency]) {
        result = self;
    } else if (rate == 0) {
        [NSException raise: @"NoConversionRateException"
                    format: @"Broker rates must have a conversion for %@ to %@", self.currency, currency];
    } else {
        NSInteger newAmount = [self.amount integerValue] * rate;
        
        result = [[Money alloc] initWithAmount:newAmount currency:currency];
    }
    return result;

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
