//
//  ItemsViewController.m
//  Homepwner2
//
//  Created by Ryan on 2/12/14.
//  Copyright (c) 2014 Ryan. All rights reserved.
//

#import "ItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"

@interface ItemsViewController ()

@end

@implementation ItemsViewController


- (id) init {
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        for (int i=0; i<5; i++) {
            [[BNRItemStore defaultStore] createItem];
        }
        
    }
    return self;
}
    
- (id)initWithStyle:(UITableViewStyle)style {
        return [self init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    for (int i=0; i<5; i++) {
        [[BNRItemStore defaultStore] createItem];
    }
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[BNRItemStore defaultStore]allItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    BNRItem *p = [[[BNRItemStore defaultStore] allItems] objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:[p description]];
    return cell;
}

- (UIView *)headerView {
    if (!headerView) {
        [[NSBundle mainBundle] loadNibNamed:@"HeadView" owner:self options:nil];
    }
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [self headerView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [[self headerView] bounds].size.height;
}

- (IBAction)toggleEditingMode:(id)sender {
    if ([self isEditing]) {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        [self setEditing:NO];
    } else {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [self setEditing:YES];
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {

    if (editingStyle == UITableViewCellEditingStyleDelete) {
        BNRItemStore *ps = [BNRItemStore defaultStore];
        NSArray *items = [ps allItems];
        BNRItem *p = [items objectAtIndex:[indexPath row]];
        [ps removeItem:p];

        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
// From Class..
//        NSArray *items = [[BNRItemStore defaultStore] allItems];
//        BNRItem *p = [items objectAtIndex:[indexPath row]];
//        [[BNRItemStore defaultStore] removeItem:[p];
//         [tableView deleteRowsAtIndexPaths:[NSArray] arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Button Methods

- (IBAction)addNewItem:(id)sender {
    BNRItem *newItem = [[BNRItemStore defaultStore] createItem];
    
    int lastRow = [[[BNRItemStore defaultStore] allItems] indexOfObject:newItem];
    
    NSIndexPath *ip = [NSIndexPath indexPathForRow:lastRow inSection:0];
    
    [[self tableView] insertRowsAtIndexPaths:[NSArray arrayWithObject:ip] withRowAnimation:UITableViewRowAnimationTop];
}

- (void)tableView:(UITableView *)aTableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailViewController = [[DetailViewController alloc] init];
    
    NSArray *items = [[BNRItemStore defaultStore] allItems];
    BNRItem *selectedItem = [items objectAtIndex:[indexPath row]];
    
    [detailViewController setItem:selectedItem];
    
    [[self navigationController] pushViewController:detailViewController animated:YES];
}
@end
