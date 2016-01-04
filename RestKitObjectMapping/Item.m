//
//  Item.m
//  RestKitObjectMapping
//
//  Created by Arthi on 12/18/15.
//  Copyright © 2015 Arthi. All rights reserved.
//

#import "Item.h"

@implementation Item
@synthesize itemDimension;
@synthesize itemID;
@synthesize itemName;
@synthesize itemTags;
@synthesize itemWarehouseLocation;
@synthesize itemPrice;

+(RKObjectMapping *)getMapping
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[self class]];
    [mapping addAttributeMappingsFromDictionary:@{
                                                  @"id":@"itemID",
                                                  @"name":@"itemName",
                                                  @"price":@"itemPrice",
                                                  @"tags":@"itemTags",
                                                  @"dimensions":@"itemDimension",
                                                  @"warehouseLocation":@"itemWarehouseLocation"
                                                  }];
    return mapping;
}

@end
