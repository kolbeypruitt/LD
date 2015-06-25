//
//  DiseaseViewController.m
//  邻医家
//
//  Created by Daniel on 15/4/30.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "MultiJobCell.h"
#import "LDHttpTool.h"
#import "MultijobDetailController.h"
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
    [self setup];
    [self loadData];
}
- (void)setup
{
    self.navigationItem.rightBarButtonItem = nil;
    self.title = @"多点执业政策";
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
    MultiJobCell *cell = [MultiJobCell cellWithTableView:tableView];
    cell.policy = self.policys[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MultijobDetailController *detailVC = [[MultijobDetailController alloc] init];
    detailVC.policy = self.policys[indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
}
@end























