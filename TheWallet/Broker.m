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

@end
@implementation Broker

- (id) init
{
    if (self = [super init]) {
        _rates = [@{}mutableCopy];
    }
    return self;
}
- (Money *) reduce: (id<Money>) money toCurrency: (NSString *) currency
{
    // Estrategia Double Dispatch >> que money implemente la reducción
    return [money reduceToCurrency:currency withBroker:self];
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

#pragma mark - Rates

- (void) parseJSONRates: (NSData *) json
{
    NSError *err = nil;
    id obj = [NSJSONSerialization JSONObjectWithData: json
                                             options: NSJSONReadingAllowFragments
                                               error: &err];
    
    if (obj != nil) {
        // Gestionar rates recividos
    } else {
        [NSException raise:@"NoRatesInJSONException" format:@"JSON must carry some data"];
    }
}
@end
