//
//  EuroTests.m
//  TheWallet
//
//  Created by Akixe on 14/8/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Euro.h"

@interface EuroTests : XCTestCase

@end

@implementation EuroTests

- (void) testMultiplication
{
    Euro *fiveEuros = [[Euro alloc] initWithAmount: 5];
    Euro *tenEuros = [[Euro alloc] initWithAmount:10];
    Euro *result = [fiveEuros times: 2];
    
    XCTAssertEqualObjects(result, tenEuros, @"5 euros * 2 should be 10 euros");
    
}

- (void) testEquality
{
    Euro *fiveEuros = [[Euro alloc] initWithAmount:5];
    Euro *tenEuros = [[Euro alloc] initWithAmount:10];
    Euro *result = [fiveEuros times:2];
    
    XCTAssertEqualObjects(result, tenEuros, @"Equivalent objects should be equals");
    XCTAssertFalse([fiveEuros isEqual:tenEuros], @"Non equivalent objects should not be equals");
    
}

- (void) testHash
{
    Euro *a = [[Euro alloc] initWithAmount:2];
    Euro *b = [[Euro alloc] initWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash], @"Equivalent Euros must have same hash");
}
@end
