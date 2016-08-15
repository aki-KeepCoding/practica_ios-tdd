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

- (Dollar *) times:(NSInteger)multiplier
{
    return [[Dollar alloc] initWithAmount:[self amount] * multiplier];
}

@end
