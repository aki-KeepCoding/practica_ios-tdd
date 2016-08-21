//
//  FakeNotificationCenter.m
//  TheWallet
//
//  Created by Akixe on 20/8/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import "FakeNotificationCenter.h"

@implementation FakeNotificationCenter

-(id) init
{
    if (self = [super init]) {
        _observers = [NSMutableDictionary dictionary];
    }
    return self;
}
-(void) addObserver: (NSObject *)observer
           selector: (SEL) aSelector
               name: (NSString *) aName
             object: (id) anObject
{
    [self.observers setObject:observer forKey:aName];
}
@end
