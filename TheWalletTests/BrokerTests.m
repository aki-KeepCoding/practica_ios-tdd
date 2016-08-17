//
//  BrokerTests.m
//  TheWallet
//
//  Created by Akixe on 16/8/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Money.h"
#import "Broker.h"
@interface BrokerTests : XCTestCase

@end

@implementation BrokerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void) testSimpleReduction
{
    Broker *broker = [[Broker alloc] init];
    
    Money *sum = [[Money dollarWithAmount:5] plus: [Money dollarWithAmount:5]];
    
    Money *reduced = [broker reduce: sum toCurrency: @"USD"];
    
    XCTAssertEqualObjects(sum, reduced, @"Conversion to de same currency should be a NOP");
}

@end
