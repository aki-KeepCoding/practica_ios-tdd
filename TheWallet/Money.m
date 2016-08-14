//
//  Money.m
//  TheWallet
//
//  Created by Akixe on 14/8/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import "Money.h"

@interface Money()
@property (nonatomic) NSInteger amount;
@end

@implementation Money

- (id) initWithAmount: (NSInteger) amount
{
    if (self = [super init]) {
        _amount = amount;
    }
    return self;
}
- (Money *) times: (NSInteger) multiplier
{
    // ToDo: Debería ser una clase abstracta
    return self;
}

@end
