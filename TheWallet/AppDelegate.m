//
//  AppDelegate.m
//  TheWallet
//
//  Created by Akixe on 14/8/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import "AppDelegate.h"
#import "WalletTableViewController.h"
#import "Wallet.h"
#import "Broker.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // Modelo
    Broker *broker = [[Broker alloc] init];
    [broker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    Wallet *wallet = [[Wallet alloc] initWithAmount:1 currency:@"EUR"];
    [wallet plus:[Money euroWithAmount:20]];
    [wallet plus:[Money euroWithAmount:30]];
    [wallet plus:[Money dollarWithAmount:10]];
    [wallet plus:[Money dollarWithAmount:10]];
    
    WalletTableViewController *walletTVC = [[WalletTableViewController alloc] initWithModel:wallet andBroker:broker];
    
    
    UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:walletTVC];
    
    self.window.rootViewController = navCtrl;
    [self.window makeKeyAndVisible ];
    return YES;
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
