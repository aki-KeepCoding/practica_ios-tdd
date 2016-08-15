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

- (Euro *) times:(NSInteger)multiplier
{
    return [[Euro alloc] initWithAmount:[self amount] * multiplier];
}

#pragma - overriden
- (BOOL) isEqual:(id)object
{
    return [self amount] == [object amount];
}

- (NSUInteger) hash
{
    return (NSUInteger) [self amount];
}
@end
