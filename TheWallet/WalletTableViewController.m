//
//  WalletTableViewController.m
//  TheWallet
//
//  Created by Akixe on 20/8/16.
//  Copyright © 2016 AOA. All rights reserved.
//

#import "WalletTableViewController.h"
#import "Wallet.h"
#import "Broker.h"

@interface WalletTableViewController ()
@property (nonatomic, strong) Wallet *wallet;
@property (nonatomic, strong) Broker *broker;
@end

@implementation WalletTableViewController

- (id) initWithModel: (Wallet *) wallet andBroker: (Broker *) broker
{
    if (self = [super initWithStyle:UITableViewStylePlain]){
        _wallet = wallet;
        _broker = broker;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *result = @"";
    
    if (section > [self.wallet currencyCount]) {
        result = nil;
    } else if (section == [self.wallet currencyCount]) {
        result = @"Total";
    } else {
        result = [self.wallet currencyAtIndex:section];
    }
    return result;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.wallet currencyCount] + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger result = 0;
    // si es la sección del Total
    if (section + 1 > [self.wallet currencyCount]) {
        result = 1;
    } else {
        NSString *sectionCurrency = [self.wallet currencyAtIndex:section];
        NSUInteger currencyCountForSection = [self.wallet countByCurrency:sectionCurrency];
        if (currencyCountForSection == 1) {
            result = 1;
        } else {
            result = currencyCountForSection + 1;
        }
    }
    return result;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *cellId = @"moneyCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
        
    }
    
    // Ves si es la sección de TOTAL
    if (indexPath.section + 1 > [self.wallet currencyCount]) {
        cell.textLabel.text = @"TOTAL (EUR)";
        Money *total = [self.wallet reduceToCurrency:@"EUR" withBroker: self.broker];
        cell.detailTextLabel.text = [total.amount stringValue];
    } else {
        // Ver si es una celda de una moneda o de un total
        //    1. Total de monedas en la sección actual
        NSString *sectionCurrency = [self.wallet currencyAtIndex:indexPath.section];
        NSUInteger moneyCountForCurrency = [self.wallet countByCurrency:sectionCurrency];
        
        //    2. Si el indexPath.row(+1 pq cuenta de 0) es monedas + 1 para la divisa actual se trata de la celda de total
        if (indexPath.row + 1 > moneyCountForCurrency) {
            // 2a. Calcular total
            cell.textLabel.text = [@"Total " stringByAppendingString: sectionCurrency];
            Money *total = [self.wallet totalByCurrency:sectionCurrency];
            cell.detailTextLabel.text = [total.amount stringValue];
        } else {
            // 2b. Celda "normal". Pintar divisa y valor
            Money *money = [self.wallet moneyAtIndex:indexPath.row forCurrrency:sectionCurrency];
            cell.textLabel.text = money.currency;
            cell.detailTextLabel.text = [money.amount stringValue];
        }
    }
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
