//
//  Broker.m
//  TheWallet
//
//  Created by Akixe on 17/8/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import "Broker.h"
#import "Money.h"

@interface Broker()
@property (nonatomic, strong) NSMutableDictionary *rates;
@end
@implementation Broker

- (id) init
{
    if (self = [super init]) {
        _rates = [@{}mutableCopy];
    }
    return self;
}
- (id<Money>) reduce: (Money *) money toCurrency: (NSString *) currency
{
    Money *result;
    double rate = [[self.rates objectForKey:[self keyFromCurrency: money.currency
                                                          toCurrency:currency]] doubleValue];
    if ([money.currency isEqual:currency]) {
        result = money;
    } else if (rate == 0) {
        [NSException raise: @"NoConversionRateException"
                    format: @"Broker rates must have a conversion for %@ to %@", money.currency, currency];
    } else {
        NSInteger newAmount = [money.amount integerValue] * rate;
        
        result = [[Money alloc] initWithAmount:newAmount currency:currency];
    }
    return result;
    
}

- (void) addRate: (NSInteger) rate
    fromCurrency: (NSString *) fromCurrency
      toCurrency: (NSString *) toCurrency
{
    [self.rates setObject:@(rate) forKey: [self keyFromCurrency:fromCurrency toCurrency:toCurrency]];
    [self.rates setObject:@(1.0/rate) forKey: [self keyFromCurrency:toCurrency toCurrency:fromCurrency]];
}

#pragma - Utils
- (NSString *) keyFromCurrency: (NSString *) fromCurrency
                    toCurrency: (NSString *) toCurrency
{
    return [NSString stringWithFormat:@"%@-%@", fromCurrency, toCurrency];
}
@end
