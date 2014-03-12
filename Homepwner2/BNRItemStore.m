//
//  BNRItemStore.m
//  Homepwner2
//
//  Created by Ryan on 2/12/14.
//  Copyright (c) 2014 Ryan. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@implementation BNRItemStore

- (id) init {
    self = [super init];
    if (self) {
        allItems = [[NSMutableArray alloc] init];
    }
    return self;
}

+ (BNRItemStore *)defaultStore {
    static BNRItemStore *(defaultStore) = nil;
    if (!defaultStore) {
        defaultStore = [[super allocWithZone:nil] init];
    }
    return defaultStore;
}

- (NSArray *)allItems {
    return allItems;
}

- (BNRItem *)createItem {
    BNRItem *p = [BNRItem randomItem];
    [allItems addObject:p];
    
    return p;
}

- (void)removeItem:(BNRItem *)p
{
    [allItems removeObjectIdenticalTo:p];
}

@end
