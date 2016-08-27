//
//  WalletTests.m
//  TheWallet
//
//  Created by Akixe on 19/8/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Money.h"
#import "Broker.h"
#import "Wallet.h"

@interface WalletTests : XCTestCase
@property (nonatomic, strong) Wallet *wallet;
@property (nonatomic, strong) Broker *broker;
@end

@implementation WalletTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.wallet = [[Wallet alloc] initWithAmount:40 currency:@"EUR"];
    self.broker = [[Broker alloc] init];
    [self.broker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.wallet = nil;
    self.broker = nil;
}
// 40€ + $20 = $100 con rate 2USD:1EUR
- (void) testAdditionWithReduction
{
    [self.wallet plus: [Money dollarWithAmount:20]];
    
    Money *reduced = [self.broker reduce:self.wallet toCurrency:@"USD"];
    XCTAssertEqualObjects(reduced, [Money dollarWithAmount:100], @"€40 + $20 = $100");
}

- (void) testThatWalletGivesCountByCurrency
{
    [self.wallet plus:[Money euroWithAmount:20]];
    [self.wallet plus:[Money dollarWithAmount:10]];
    XCTAssertEqual(2, [self.wallet countByCurrency:@"EUR"], @"Wallet currency count for EUR should be 2");
}

- (void) testThatWalletGivesTotalByCurrency
{
    [self.wallet plus:[Money euroWithAmount:20]]; // 40€ + 20€
    [self.wallet plus:[Money dollarWithAmount:10]];
    Money *sixtyEuros = [Money euroWithAmount:60];
    XCTAssertEqualObjects(sixtyEuros, [self.wallet totalByCurrency:@"EUR"], @"Wallet euros total amount should be 60");
}

- (void) testThatWalletGivesTheMoneyAtGivenIndex
{
    [self.wallet plus: [Money euroWithAmount:20]];
    [self.wallet plus: [Money dollarWithAmount:10]];
    [self.wallet plus: [Money dollarWithAmount:20]];
    
    Money *money1 = [self.wallet moneyAtIndex:0 forCurrrency:@"EUR"];
    Money *money2 = [self.wallet moneyAtIndex:1 forCurrrency:@"USD"];
    
    Money *fortyEuros = [Money euroWithAmount:40];
    XCTAssertEqualObjects(fortyEuros, money1, @"The money at position 0 for EUR shoud be 40€");
    
    Money *twentyDollars = [Money dollarWithAmount:20];
    XCTAssertEqualObjects(twentyDollars, money2, @"The money at position 1 for USD shoud be 20$");
}

- (void) testThatWalletGivesCurrenciesCount
{
    [self.wallet plus: [Money euroWithAmount:20]];
    [self.wallet plus: [Money dollarWithAmount:20]];
    
    XCTAssertEqual(2, [self.wallet currencyCount], @"Currency count should be 2");
    
}

- (void) testThatWalletReturnsCurrencyForSectionIndex
{
    XCTAssertEqualObjects(@"EUR",[self.wallet currencyAtIndex:0], @"Currency for Section 0 should be EUR");
}

@end
