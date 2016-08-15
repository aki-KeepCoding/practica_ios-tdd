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

- (void) testMultiplication
{
    Money *fiveEuros = [Money euroWithAmount: 5];
    Money *tenEuros = [Money euroWithAmount: 10];
    Money *result = [fiveEuros times: 2];
    
    XCTAssertEqualObjects(result, tenEuros, @"5 euros * 2 should be 10 euros");
}

- (void) testEquality
{
    Money *fiveEuros = [Money euroWithAmount: 5];
    Money *tenEuros = [Money euroWithAmount: 10];
    Money *result = [fiveEuros times:2];
    
    XCTAssertEqualObjects(result, tenEuros, @"Equivalent euros should be equals");
    XCTAssertFalse([fiveEuros isEqual:tenEuros], @"Non equivalent euros should not be equals");
    
    // Comprobar con dólares
    XCTAssertEqualObjects([Money dollarWithAmount:4], [[Money dollarWithAmount:2] times:2], @"Equivalent dollars should be equals");
    
}

- (void) testHash
{
    Money *a = [Money euroWithAmount: 2];
    Money *b = [Money euroWithAmount: 2];
    
    XCTAssertEqual([a hash], [b hash], @"Equivalent Euros must have same hash");
    
    // Comprobar con dólares
    XCTAssertEqual([[Money dollarWithAmount:1] hash], [[Money dollarWithAmount:1] hash], @"Equivalent Dollars must have same hash");
}

- (void) testAmountValue
{
    Money *euro = [Money euroWithAmount: 5];
    
    // Ignorar para el selector amount
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual([[euro performSelector:@selector(amount)] integerValue], 5, @"Initialized amount for Euros should be equal to assigned value");
    
    // Comprobar con dólares
    XCTAssertEqual([[[Money dollarWithAmount:5] performSelector:@selector(amount)] integerValue], 5, @"Initialized amount for Dollars should be equal to assigned value");
#pragma clang diagnostic pop
}


- (void) testCurrencies
{
    XCTAssertEqualObjects(@"EUR", [[Money euroWithAmount:2] currency], @"The currency of euro should be EUR");
    XCTAssertEqualObjects(@"USD", [[Money dollarWithAmount:2] currency], @"The currency of dollar should be USD");
}
@end
