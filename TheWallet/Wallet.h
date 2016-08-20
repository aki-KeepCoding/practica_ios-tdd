//
//  Wallet.h
//  TheWallet
//
//  Created by Akixe on 18/8/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Money.h"

@interface Wallet : NSObject<Money>
@property (nonatomic, readonly) NSUInteger count;
@end
