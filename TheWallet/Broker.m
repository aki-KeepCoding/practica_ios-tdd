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
- (Money *) reduce: (Money *) money toCurrency: (NSString *) currency
{
    return money;
}

- (void) addRate: (NSInteger) rate
    fromCurrency: (NSString *) fromCurrency
      toCurrency: (NSString *) toCurrency
{
    [self.rates setObject:@(rate) forKey: [self keyFromCurrency:fromCurrency toCurrency:toCurrency]];
}

#pragma - Utils
- (NSString *) keyFromCurrency: (NSString *) fromCurrency
                    toCurrency: (NSString *) toCurrency
{
    return [NSString stringWithFormat:@"%@-%@", fromCurrency, toCurrency];
}
@end
