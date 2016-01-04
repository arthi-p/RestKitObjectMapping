//
//  Item.h
//  RestKitObjectMapping
//
//  Created by Arthi on 12/18/15.
//  Copyright © 2015 Arthi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit.h>
@interface Item : NSObject

@property(nonatomic,retain) NSString *itemID;
@property(nonatomic,retain) NSString *itemName;
@property(nonatomic,retain) NSArray *itemTags;
@property(nonatomic,retain) NSDictionary *itemDimension;
@property(nonatomic,retain) NSDictionary *itemWarehouseLocation;
@property(nonatomic,retain) NSString *itemPrice;

+(RKObjectMapping *)getMapping;

@end

