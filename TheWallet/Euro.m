//
//  Euro.m
//  TheWallet
//
//  Created by Akixe on 14/8/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import "Euro.h"
#import "Money-Private.h"

@implementation Euro

- (Euro *) times:(NSInteger)multiplier
{
    return [[Euro alloc] initWithAmount:[[self amount] integerValue] * multiplier];
}


@end
