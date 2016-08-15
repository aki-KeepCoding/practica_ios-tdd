//
//  DollarTests.m
//  TheWallet
//
//  Created by Akixe on 14/8/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Dollar.h"
#import "Money.h"

@interface DollarTests : XCTestCase

@end

@implementation DollarTests

- (void) testMultiplication
{
    Dollar *fiveDollars = [Money dollarWithAmount: 5];
    Dollar *tenDollars = [Dollar dollarWithAmount:10];
    Dollar *result = [fiveDollars times: 2];
    
    XCTAssertEqualObjects(result, tenDollars, @"5 dollars * 2 should be 10 dollars");
    
}

- (void) testEquality
{
    Dollar *fiveDollars = [Money dollarWithAmount: 5];
    Dollar *tenDollars = [Money dollarWithAmount: 10];
    Dollar *result = [fiveDollars times:2];
    
    XCTAssertEqualObjects(result, tenDollars, @"Equivalent objects should be equals");
    XCTAssertFalse([fiveDollars isEqual:tenDollars], @"Non equivalent objects should not be equals");
}

- (void) testHash
{
    Dollar *a = [Money dollarWithAmount: 1];
    Dollar *b = [Money dollarWithAmount: 1];
    
    XCTAssertEqual([a hash], [b hash], @"Equivalent Dollars must have same hash");
}

- (void) testAmountValue
{
    Dollar *dollar = [Money dollarWithAmount: 5];
    
    // Ignorar para el selector amount
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual([[dollar performSelector:@selector(amount)] integerValue], 5, @"Initialized amount should be equal to assigned value");
#pragma clang diagnostic pop
}
@end
