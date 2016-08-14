//
//  NSObject+GNUStepAddons.m
//  TheWallet
//
//  Created by Akixe on 14/8/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import <objc/runtime.h>
#import "NSObject+GNUStepAddons.h"

@implementation NSObject (GNUStepAddons)

- (id) sublclassResponsibility:(SEL)aSel
{
    char prefix = class_isMetaClass(object_getClass(self)) ? '+' : '-';
    
    [NSException raise: NSInvalidArgumentException
                format: @"%@%c%@ should be overriden by its subclass",
     NSStringFromClass([self class]), prefix, NSStringFromSelector(aSel)];
    
    return self;
}
@end
