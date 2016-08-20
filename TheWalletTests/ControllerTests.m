//
//  ControllerTests.m
//  TheWallet
//
//  Created by Akixe on 20/8/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SimpleViewController.h"

@interface ControllerTests : XCTestCase
@property (nonatomic, strong) SimpleViewController *simpleVC;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *label;
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
@end

