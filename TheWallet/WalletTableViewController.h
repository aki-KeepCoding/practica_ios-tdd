//
//  WalletTableViewController.h
//  TheWallet
//
//  Created by Akixe on 20/8/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Wallet;
@interface WalletTableViewController : UITableViewController

- (id) initWithModel: (Wallet *) wallet;
@end
