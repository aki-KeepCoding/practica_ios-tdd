//
//  MoneyTests.m
//  TheWallet
//
//  Created by Akixe on 14/8/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Money.h"

@interface MoneyTests : XCTestCase

@end

@implementation MoneyTests

- (void) testsThatTimesRaisesException
{
    Money *money = [[Money alloc] initWithAmount:5];
    XCTAssertThrows([money times: 2], @"Direct call to times: from Money should raise an exception");
}
@end
