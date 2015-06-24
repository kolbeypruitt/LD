//
//  DiseaseViewController.m
//  邻医家
//
//  Created by Daniel on 15/4/30.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDHttpTool.h"
#import "MultiJobController.h"
#import "Common.h"
#import "MJExtension.h"
#import "IWSettingGroup.h"
#import "AFNetworking.h"
#import "IWSettingArrowItem.h"
#import "Policy.h"
@interface MultiJobController ()

@end

@implementation MultiJobController
- (NSMutableArray *)policys
{
    if (_policys == nil ) {
        _policys = [NSMutableArray array];
    }
    return _policys;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"多点执业政策";
    [self loadData];
}

- (void)loadData
{
    [LDHttpTool getWithURL:MULTIJOBURL params:nil success:^(id json) {
         NSArray *tmpArray = [Policy objectArrayWithKeyValuesArray:json[@"policys"]];
        [self.policys addObjectsFromArray:tmpArray];
        [self.tableView reloadData]; 
    } failure:^(NSError *error) {
        
    }];
}
#pragma mark tableview datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.policys.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Policy *pl = self.policys[indexPath.row];
    static NSString *ID = @"multicell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.textLabel.text = pl.name;
    return cell;
}

@end
