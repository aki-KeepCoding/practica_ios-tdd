//
//  Broker.h
//  TheWallet
//
//  Created by Akixe on 17/8/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Money;
@interface Broker : NSObject

- (Money *) reduce: (Money *) money toCurrency: (NSString *) currency;
- (void) addRate: (NSInteger) rate
    fromCurrency: (NSString *) fromCurrency
      toCurrency: (NSString *) toCurrency;
@end
