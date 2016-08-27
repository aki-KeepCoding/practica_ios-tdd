//
//  Wallet.m
//  TheWallet
//
//  Created by Akixe on 18/8/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import "Wallet.h"
#import "Money.h"
@import UIKit;

@interface Wallet()
@property (nonatomic, strong) NSMutableArray *moneys;
@end
@implementation Wallet

- (NSUInteger) count {
    return [self.moneys count];
}
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


- (NSUInteger) countByCurrency: (NSString *) currency
{
    NSUInteger c = 0;
    for (Money *money in self.moneys) {
        if ([money.currency isEqual:currency]) {
            c++;
        }
    }
    return c;
}

- (NSUInteger) currencyCount
{
    NSMutableSet *currencies = [NSMutableSet set];
    for (Money *money in self.moneys) {
        [currencies addObject:money.currency];
    }
    return [currencies count];
}

- (NSString *) currencyAtIndex: (NSUInteger) index
{
    NSMutableSet *currencies = [NSMutableSet set];
    for (Money *money in self.moneys) {
        [currencies addObject:money.currency];
    }
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"description" ascending:YES];
    NSArray *sortedCurrencies = [currencies sortedArrayUsingDescriptors: [NSArray arrayWithObject:descriptor]];
    return [sortedCurrencies objectAtIndex:index];
}

- (Money *) moneyAtIndex: (NSInteger) index forCurrrency: (NSString *) currency
{
    NSMutableArray *currencyMoneys = [NSMutableArray array];
    for (Money *money in self.moneys) {
        if ([money.currency isEqual:currency]) {
            [currencyMoneys addObject: money];
        }
    }
    return [currencyMoneys objectAtIndex:index];
}

- (Money *) totalByCurrency: (NSString *) currency
{
    NSUInteger totalAmount = 0;
    for (Money *money in self.moneys) {
        if ([money.currency isEqual:currency]) {
            totalAmount += [money.amount integerValue];
        }
    }
    Money *result = [[Money alloc] initWithAmount: totalAmount currency: currency];
    return result;
}

#pragma mark - Notifications
- (void) subscribeToMemoryWarning:(NSNotificationCenter *) nc
{
    [nc addObserver: self
           selector: @selector(dumpToDisk:)
               name: UIApplicationDidReceiveMemoryWarningNotification
             object: nil];
}

- (void) dumpToDisk: (NSNotification *) notification {
    
}
@end
