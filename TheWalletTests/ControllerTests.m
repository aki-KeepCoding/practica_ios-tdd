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
@interface ControllerTests : XCTestCase
@property (nonatomic, strong) SimpleViewController *simpleVC;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) WalletTableViewController *walletTVC;
@property (nonatomic, strong) Wallet *wallet;
@end

@implementation ControllerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.simpleVC = [[SimpleViewController alloc] initWithNibName:nil bundle:nil];
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setTitle:@"Hola" forState:UIControlStateNormal];
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    self.simpleVC.displayLabel = self.label;
    
    self.wallet = [[Wallet alloc] initWithAmount:1 currency:@"USD"];
    self.walletTVC = [[WalletTableViewController alloc] initWithModel: self.wallet];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.simpleVC = nil;
    self.button = nil;
    self.label = nil;
}


- (void) testThatTextOnLabelIsEqualToTextOnButton
{
    // 1) Mandar mensaje
    [self.simpleVC displayText:self.button];
    
    // 2) Comprobar etiqueta y botón tienen mismo txt
    XCTAssertEqualObjects(self.button.titleLabel.text, self.label.text, @"Button and label should have same text");
}

- (void) testThatTableHasOneSection
{
    NSUInteger sections = [self.walletTVC numberOfSectionsInTableView:nil];
    XCTAssertEqual(sections, 1, @"Ther can only be one");
}

- (void) testThatNumberOfCellsIsNumberOfMoneysPlusOne
{
    XCTAssertEqual(self.wallet.count + 1, [self.walletTVC tableView:nil numberOfRowsInSection:0], @"Number of cells is the number of moneys + 1 (the total)");
}

- (void) testThatSubscribesToMemoryWarning {
    // NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    //   No interesa implementar NSNotificationCenter real...creamos un fake>>
    FakeNotificationCenter *fake = [FakeNotificationCenter new];
    BigAndFatObject *fat = [BigAndFatObject new];
    [fat subscribeToMemoryWarning: fake];
    
    NSDictionary *obs = [fake observers];
    id observer = [obs objectForKey:UIApplicationDidReceiveMemoryWarningNotification];
    
    XCTAssertEqualObjects(observer, fat, @"FAt object must subscribe to UIApplicationDidReceiveMemoryWarningNotification");
}
@end

