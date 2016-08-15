//
//  Money.m
//  TheWallet
//
//  Created by Akixe on 14/8/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import "Money.h"
#import "NSObject+GNUStepAddons.h"

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
    // Al ser un método abstracto la implementación de
    //   times: debería estar en manos de la subclase
    return [self sublclassResponsibility:_cmd];
}

#pragma - overriden
- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@%ld>", [self class], (long)[self amount]];
}

@end
