//
//  EuroTests.m
//  TheWallet
//
//  Created by Akixe on 14/8/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Euro.h"
#import "Money.h"

@interface EuroTests : XCTestCase

@end

@implementation EuroTests

- (void) testMultiplication
{
    Euro *fiveEuros = [Money euroWithAmount: 5];
    Euro *tenEuros = [Money euroWithAmount: 10];
    Euro *result = [fiveEuros times: 2];
    
    XCTAssertEqualObjects(result, tenEuros, @"5 euros * 2 should be 10 euros");
}

- (void) testEquality
{
    Euro *fiveEuros = [Money euroWithAmount: 5];
    Euro *tenEuros = [Money euroWithAmount: 10];
    Euro *result = [fiveEuros times:2];
    
    XCTAssertEqualObjects(result, tenEuros, @"Equivalent objects should be equals");
    XCTAssertFalse([fiveEuros isEqual:tenEuros], @"Non equivalent objects should not be equals");
    
}

- (void) testHash
{
    Euro *a = [Money euroWithAmount: 2];
    Euro *b = [Money euroWithAmount: 2];
    
    XCTAssertEqual([a hash], [b hash], @"Equivalent Euros must have same hash");
}

- (void) testAmountValue
{
    Euro *euro = [Money euroWithAmount: 5];
    
    // Ignorar para el selector amount
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual([[euro performSelector:@selector(amount)] integerValue], 5, @"Initialized amount should be equal to assigned value");
#pragma clang diagnostic pop
}
@end
