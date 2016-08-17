//
//  Broker.m
//  TheWallet
//
//  Created by Akixe on 17/8/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import "Broker.h"
#import "Money.h"
@implementation Broker

- (Money *) reduce: (Money *) money toCurrency: (NSString *) currency
{
    return money;
}
@end
