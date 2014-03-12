//
//  ItemsViewController.h
//  Homepwner2
//
//  Created by Ryan on 2/12/14.
//  Copyright (c) 2014 Ryan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailViewController.h"

@interface ItemsViewController : UITableViewController
{
    IBOutlet UIView *headerView;
}

- (UIView *)headerView;
- (IBAction)addNewItem:(id)sender;
- (IBAction)toggleEditingMode:(id)sender;

@end