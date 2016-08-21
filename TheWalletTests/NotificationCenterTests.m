//
//  NotificationCenterTests.m
//  TheWallet
//
//  Created by Akixe on 20/8/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FakeNotificationCenter.h"
#import "Wallet.h"

@interface NotificationCenterTests : XCTestCase

@end

@implementation NotificationCenterTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void) testThatSubscribesToMemoryWarning {
    // NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    //   No interesa implementar NSNotificationCenter real...creamos un fake>>
    FakeNotificationCenter *fake = [FakeNotificationCenter new];
    Wallet *wallet = [Wallet new];
    [wallet subscribeToMemoryWarning:(NSNotificationCenter *) fake];
    
    NSDictionary *obs = [fake observers];
    id observer = [obs objectForKey:UIApplicationDidReceiveMemoryWarningNotification];
    
    XCTAssertEqualObjects(observer, wallet, @"Wallet object must subscribe to UIApplicationDidReceiveMemoryWarningNotification");
}

@end
