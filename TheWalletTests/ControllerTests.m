//
//  ControllerTests.m
//  TheWallet
//
//  Created by Akixe on 20/8/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SimpleViewController.h"
#import "WalletTableViewController.h"
#import "Wallet.h"
#import "Broker.h"

@interface ControllerTests : XCTestCase
@property (nonatomic, strong) SimpleViewController *simpleVC;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *label;


// WalletTableViewCtrl
@property (nonatomic, strong) WalletTableViewController *walletTVC;
@property (nonatomic, strong) Wallet *wallet;
@property (nonatomic, strong) Broker *broker;
@property (nonatomic, strong) UITableView *mockTableView;
@end;

@implementation ControllerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.simpleVC = [[SimpleViewController alloc] initWithNibName:nil bundle:nil];
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setTitle:@"Hola" forState:UIControlStateNormal];
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    self.simpleVC.displayLabel = self.label;
    
    // WalletTableViewCtrl
    self.wallet = [[Wallet alloc] initWithAmount:1 currency:@"EUR"];
    self.broker = [[Broker alloc] init];
    [self.broker addRate: 2 fromCurrency: @"EUR" toCurrency: @"USD"];
    self.walletTVC = [[WalletTableViewController alloc] initWithModel: self.wallet andBroker: self.broker];
    
    self.mockTableView = [[UITableView alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.simpleVC = nil;
    self.button = nil;
    self.label = nil;
    
    // WalletTableViewCtrl
    self.wallet = nil;
    self.broker = nil;
    self.mockTableView = nil;
}


- (void) testThatTextOnLabelIsEqualToTextOnButton
{
    // 1) Mandar mensaje
    [self.simpleVC displayText:self.button];
    
    // 2) Comprobar etiqueta y botón tienen mismo txt
    XCTAssertEqualObjects(self.button.titleLabel.text, self.label.text, @"Button and label should have same text");
}



// WalletTableViewCtrl
- (void) testThatNumberOfSectionsIsNumberOfCurrenciesPlusOne
{
    NSUInteger sections = [self.walletTVC numberOfSectionsInTableView:self.mockTableView];
    XCTAssertEqual(sections, 2, @"There can only be one");
}

- (void) testThatNumberOfCellsIsNumberOfMoneysPlusOneWhenMoreThanOneMoneyForAGivenCurrency
{
    [self.wallet plus:[Money euroWithAmount:10]];
    XCTAssertEqual([self.wallet countByCurrency:@"EUR"] + 1, [self.walletTVC tableView:self.mockTableView numberOfRowsInSection:0], @"Number of cells is the number of Euros + 1 (2 uros + the total cell)");
}

- (void) testThatNumberOfCellsIsNumberOfMoneysWhenOnlyOneMoneyForAGivenCurrency
{
    XCTAssertEqual([self.wallet countByCurrency:@"EUR"], [self.walletTVC tableView:self.mockTableView numberOfRowsInSection:0], @"Number of cells is 1 (Only one Euro in the wallet)");
}

- (void) testThatTitleForSectionIsTheCurrencyName
{
    NSString *sectionTitle = [self.walletTVC tableView:self.mockTableView titleForHeaderInSection:0];
    XCTAssertEqualObjects(@"EUR", sectionTitle, @"The first sections title of this wallet table view is EUR");
}

- (void) testThatLastSectionsTitleIsTotal
{
    NSString *sectionTitle = [self.walletTVC tableView:self.mockTableView titleForHeaderInSection:[self.wallet currencyCount]];
    XCTAssertEqualObjects(@"Total", sectionTitle, @"Last section title of wallet table view is Total");
}


@end

