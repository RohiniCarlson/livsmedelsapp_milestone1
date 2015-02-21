//
//  FoodItemsTable.m
//  Livsmedelsapp
//
//  Created by it-högskolan on 2015-02-20.
//  Copyright (c) 2015 it-högskolan. All rights reserved.
//

#import "FoodItemsTable.h"
#import "FoodItem.h"
#import "FoodItemCell.h"
#import "FoodItemDetail.h"

@interface FoodItemsTable ()

@end

@implementation FoodItemsTable

NSArray *foodItems;
NSArray *searchResults;

- (void)viewWillAppear:(BOOL)animated {
    //self.tableView.rowHeight = 75;
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.toolbarHidden = NO;
    //self.tableView.rowHeight = 75;
    FoodItem *item1 = [[FoodItem alloc] initWithName:@"Knäckebröd" energy:345.0f fat:2.4f fibre:14.5f water:7.2f protein:9.6f carbs:63.3f];
    FoodItem *item2 = [[FoodItem alloc] initWithName:@"Vetemjöl" energy: 352.0f fat:1.9f fibre:3.6f water:13.2f protein:8.5f carbs:72.3f];
    FoodItem *item3 = [[FoodItem alloc]initWithName:@"Morot" energy:36.0f fat:0.2f fibre:2.4f water:89.5f protein:0.7f carbs:6.6f];
    foodItems = @[item1, item2, item3];
                       
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



- (void)searchDisplayController:(UISearchDisplayController *)controller didLoadSearchResultsTableView:(UITableView *)tableView
{
    tableView.rowHeight = 75.0f;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return foodItems.count;
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
        
    } else {
        return [foodItems count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIdentifier = @"FoodItemCell";
   
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"FoodItemCell" owner:self options:nil];
    
    [tableView registerClass:[FoodItemCell class] forCellReuseIdentifier:@"FoodItemCell"];
    
    FoodItemCell *cell = (FoodItemCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    cell = [nib objectAtIndex:0];
    
    FoodItem *foodItem = nil;
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        foodItem = [searchResults objectAtIndex:indexPath.row];
    } else {
        foodItem = [foodItems objectAtIndex:indexPath.row];
    }
    
    cell.foodItemLabel.text = [foodItems[indexPath.row] name];
    cell.fatContentLabel.text = [NSString stringWithFormat:@"%.1fg", [foodItems[indexPath.row] fat]];
    return cell;
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"name contains[c] %@", searchText];
    searchResults = [foodItems filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
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


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    if ([segue.identifier isEqualToString:@"Detail"]){
        FoodItemDetail *detailView = [segue destinationViewController];
        detailView.item = [foodItems objectAtIndex:indexPath.row];
    } else {
        NSLog(@"You forgot the segue %@",segue);
    }
}

// This method was required to get segue working. Why????????
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:@"Detail" sender:nil];
}


- (CGFloat)tableView:(UITableView *)tableView
estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75.0f;
}

/*- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}*/

@end
