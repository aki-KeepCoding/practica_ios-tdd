//
//  Money.h
//  TheWallet
//
//  Created by Akixe on 14/8/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Money : NSObject
+ (id) euroWithAmount: (NSInteger) amount;
+ (id) dollarWithAmount: (NSInteger) amount;
- (id) initWithAmount: (NSInteger) amount;
- (id) times: (NSInteger) multiplier;
@end
