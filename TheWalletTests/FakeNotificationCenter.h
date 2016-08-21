//
//  FakeNotificationCenter.h
//  TheWallet
//
//  Created by Akixe on 20/8/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FakeNotificationCenter : NSObject
@property (nonatomic, strong) NSMutableDictionary *observers;

-(void) addObserver:(NSObject *)observer selector:(SEL) aSelector name: (NSString *) aName object: (id) anObject;
@end
