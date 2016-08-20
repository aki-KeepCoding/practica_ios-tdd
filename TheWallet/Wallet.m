//
//  Wallet.m
//  TheWallet
//
//  Created by Akixe on 18/8/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import "Wallet.h"

@interface Wallet()
@property (nonatomic, strong) NSMutableArray *moneys;
@end
@implementation Wallet

- (id) initWithAmount:(NSInteger)amount currency:(NSString *)currency
{
    if (self = [super init]) {
        Money *money = [[Money alloc] initWithAmount:amount currency:currency];
        _moneys = [NSMutableArray array];
        [_moneys addObject:money];
    }
    return self;
}

- (id<Money>) plus:(Money *)money
{
    [self.moneys addObject:money];
    return self;
}

- (id<Money>) times:(NSInteger)multiplier
{
    NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity:self.moneys.count];
    
    for (Money *money in self.moneys) {
        Money *newMoney = [money times:multiplier];
        [newMoneys addObject:newMoney];
    }
    self.moneys = newMoneys;
    return self;
}

- (id<Money>) reduceToCurrency:(NSString *)currency withBroker:(Broker *)broker
{
    Money *result = [[Money alloc] initWithAmount:0 currency:currency];
    
    for (Money *money in self.moneys) {
        result = [result plus:[money reduceToCurrency:currency withBroker:broker]];
    }
    
    return result;
}
@end
