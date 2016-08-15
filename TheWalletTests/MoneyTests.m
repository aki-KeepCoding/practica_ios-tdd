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

- (void) testCurrencies
{
    XCTAssertEqualObjects(@"EUR", [[Money euroWithAmount:2] currency], @"The currency of euro should be EUR");
    XCTAssertEqualObjects(@"USD", [[Money dollarWithAmount:2] currency], @"The currency of dollar should be USD");
}
@end
