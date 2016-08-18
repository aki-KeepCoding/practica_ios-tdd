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
@property (nonatomic, strong) Broker *emptyBroker;
@property (nonatomic, strong) Money *oneDollar;
@end

@implementation BrokerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.emptyBroker = [[Broker alloc] init];
    self.oneDollar = [Money dollarWithAmount:1];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.emptyBroker = nil;
    self.oneDollar = nil;
}

- (void) testSimpleReduction
{
    Money *sum = [[Money dollarWithAmount:5] plus: [Money dollarWithAmount:5]];
    
    Money *reduced = [self.emptyBroker reduce: sum toCurrency: @"USD"];
    
    XCTAssertEqualObjects(sum, reduced, @"Conversion to de same currency should be a NOP");
}

- (void) testReduction
{
    Money *tenDollars = [Money dollarWithAmount:10];
    Money *fiveEuros = [Money euroWithAmount:5];
    
    [self.emptyBroker addRate: 2 fromCurrency: @"EUR" toCurrency: @"USD"];
    
    Money *reduced = [self.emptyBroker reduce: tenDollars toCurrency:@"EUR"];
    
    XCTAssertEqualObjects(reduced, fiveEuros, @"10$ = 5€ with 2USD:1EUR tax");
}

- (void) testThatHashIsAmount
{
    Money *oneEuro = [Money euroWithAmount:1];
    
    XCTAssertEqual(1, [oneEuro hash], @"one euro hash shoud be = 1");
}

- (void) testDescription
{
    Money *oneEuro = [Money euroWithAmount:1];
    NSString *desc = @"<Money: EUR 1>";
    
    XCTAssertEqualObjects(desc, [oneEuro description], @"One euro Description shoud be <Money: 1>");
}

- (void) testThatNoRateRaisesException
{
    XCTAssertThrows([self.emptyBroker reduce:self.oneDollar toCurrency:@"EUR"], @"No rates should cause exception");
}


- (void) testThatNoCurrencyConversionDontChangeMoney
{
    XCTAssertEqualObjects(self.oneDollar, [self.emptyBroker reduce:self.oneDollar toCurrency:@"USD"], @"No currency change in conversion should not change money");
}
@end
