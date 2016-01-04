//
//  ViewController.m
//  RestKitObjectMapping
//
//  Created by Arthi on 12/18/15.
//  Copyright © 2015 Arthi. All rights reserved.
//

#import "ViewController.h"
#import <RestKit.h>
#import <RKObjectMappingOperationDataSource.h>
#import "Item.h"
#import "Sample_Array.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getData];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSDictionary *)getData
{
    NSString *filePath         = [[NSBundle mainBundle]pathForResource:@"Sample_JSON" ofType:nil];
    NSData *fileData           = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *fileJSONData = [NSJSONSerialization JSONObjectWithData:fileData options:NSJSONReadingMutableContainers error:nil];
    [self performMappingForData:fileJSONData];
    return fileJSONData;
}

-(NSArray *)performMappingForData:(NSDictionary *)jsonData
{
    RKObjectMapping *mainMapping    = [[RKObjectMapping alloc]initWithClass:[Sample_Array class]];
    Sample_Array *array             = [[Sample_Array alloc]init];
    NSArray *itemArray              = [[NSArray alloc]init];
    RKObjectMapping *itemObjMapping = [Item getMapping];
    
    [mainMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:nil toKeyPath:@"items" withMapping:itemObjMapping]];

    RKMappingOperation *op = [[RKMappingOperation alloc] initWithSourceObject:jsonData destinationObject:array mapping:mainMapping];
    RKObjectMappingOperationDataSource *mappingDS = [RKObjectMappingOperationDataSource new];
    op.dataSource = mappingDS;
    [op performMapping:nil];
    
    return itemArray;
}
@end
