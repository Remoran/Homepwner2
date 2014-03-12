//
//  BNRItemStore.h
//  Homepwner2
//
//  Created by Ryan on 2/12/14.
//  Copyright (c) 2014 Ryan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;
@interface BNRItemStore : NSObject
{
    NSMutableArray *allItems;
}

+ (BNRItemStore *)defaultStore;
- (void)removeItem:(BNRItem *)p;
- (NSArray *)allItems;
- (BNRItem *)createItem;

@end
