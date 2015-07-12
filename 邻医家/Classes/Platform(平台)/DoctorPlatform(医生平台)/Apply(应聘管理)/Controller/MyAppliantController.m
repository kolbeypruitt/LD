//
//  MyAppliantController.m
//  邻医家
//
//  Created by Daniel on 15/7/10.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "MultiInviteDetailController.h"
#import "ApplianTool.h"
#import "MyAppliantController.h"
#import "RecruitResult.h"
#import "MultiInviteCell.h"
#import "EmployInfo.h"
#import "MyAppliatDetailController.h"
@interface MyAppliantController ()
@property (nonatomic,strong) NSMutableArray *employInfos;
@end

@implementation MyAppliantController
- (NSMutableArray *)employInfos
{
    if (_employInfos == nil) {
        _employInfos = [NSMutableArray array];
    }
    return _employInfos;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self setup];
}
- (void)loadData
{
    [ApplianTool myAppliantSuccess:^(RecruitResult *result) {
        if ([result.status isEqualToString:@"S"]) {
            [self.employInfos addObjectsFromArray:result.employInfos];
            [self.tableView reloadData];
        }
    } failure:^(NSError *error) {
        
    }];
}
- (void)setup
{
    self.title = @"已应聘的招聘列表";
}


#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.employInfos.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MultiInviteCell *cell = [MultiInviteCell cellWithTableView:tableView];
    cell.employInfo = self.employInfos[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 66;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyAppliatDetailController *detaiVC = [[MyAppliatDetailController alloc] init];
    detaiVC.empinfo = self.employInfos[indexPath.row];
    [self.navigationController pushViewController:detaiVC animated:YES];
}
@end
