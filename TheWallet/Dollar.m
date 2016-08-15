//
//  Dollar.m
//  TheWallet
//
//  Created by Akixe on 14/8/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import "Dollar.h"
#import "Money-Private.h"

@implementation Dollar

- (Dollar *) times:(NSInteger)multiplier
{
    return [[Dollar alloc] initWithAmount:[[self amount] integerValue] * multiplier];
}

@end
