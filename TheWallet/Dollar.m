//
//  Dollar.m
//  TheWallet
//
//  Created by Akixe on 14/8/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import "Dollar.h"

@interface Dollar()
@property (nonatomic) NSInteger amount;

@end
@implementation Dollar

- (id) initWithAmount:(NSInteger)amount
{
    if (self = [super init]) {
        _amount = amount;
    }
    return self;
}

- (Dollar *) times:(NSInteger)multiplier
{
    return [[Dollar alloc] initWithAmount:[self amount] * multiplier];
}

#pragma - overriden
- (BOOL) isEqual:(id)object
{
    return [self amount] == [object amount];
}
@end
