//
//  Dollar.h
//  TheWallet
//
//  Created by Akixe on 14/8/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dollar : NSObject
- (id) initWithAmount: (NSInteger) amount;
- (Dollar *) times: (NSInteger) multiplier;
@end
