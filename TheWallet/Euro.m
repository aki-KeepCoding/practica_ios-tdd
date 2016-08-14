//
//  Euro.m
//  TheWallet
//
//  Created by Akixe on 14/8/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import "Euro.h"

@interface Euro()
@property (nonatomic) NSInteger amount;
@end

@implementation Euro

- (id) initWithAmount:(NSInteger)amount
{
    if (self = [super init]) {
        _amount = amount;
    }
    return self;
}

- (void) times:(NSInteger)multiplier
{
    self.amount *= multiplier;
}

@end
