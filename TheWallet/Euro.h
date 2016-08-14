//
//  Euro.h
//  TheWallet
//
//  Created by Akixe on 14/8/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Euro : NSObject
@property (nonatomic, readonly) NSInteger amount;
- (id) initWithAmount:(NSInteger) amount;
- (void) times: (NSInteger) multiplier;
@end
