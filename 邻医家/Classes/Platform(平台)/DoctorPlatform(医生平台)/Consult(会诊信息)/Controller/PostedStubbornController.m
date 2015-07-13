//
//  PostedStubbornController.m
//  邻医家
//
//  Created by Daniel on 15/6/7.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "DonConsultCell.h"
#import "DocGetInfoTool.h"
#import "ConsultMessage.h"
#import "QueryConsultResult.h"
#import "PostedStubbornController.h"
#import "MJRefresh.h"
#import "MyConsultViewController.h"
@interface PostedStubbornController ()
@property (nonatomic,strong) NSMutableArray *consults;
@end

@implementation PostedStubbornController
- (NSMutableArray *)consults
{
    if (_consults == nil) {
        _consults = [NSMutableArray array];
    }
    return _consults;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupRefresh];
    [self setup];
}
- (void)loadData
{
    [DocGetInfoTool getGCInfoListWithParam:self.param success:^(QueryConsultResult *result) {
        if (self.consults.count) {
            [self.consults removeAllObjects];
        }
        [self.consults  addObjectsFromArray:result.gs];
        [self.tableView reloadData];
        [self.tableView.header endRefreshing];
    } failure:^(NSError *error) {
        
    }];
}
- (void)setup
{
    self.title = @"疑难杂症会诊";
    self.navigationItem.rightBarButtonItem = nil;
}
- (void)setupRefresh
{
    __weak typeof (self) weakSelf = self;
    [self.tableView addLegendHeaderWithRefreshingBlock:^{
        [weakSelf loadData];
    }];
    [self.tableView.header beginRefreshing];
}
- (void)refreshData
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.header endRefreshing];
    });
}
#pragma mark - TableView DataSource and Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.consults.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DonConsultCell *cell = [DonConsultCell cellWithTable:tableView];
    cell.message = [self.consults objectAtIndex:indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyConsultViewController *consultVC = [[MyConsultViewController alloc] init];
    consultVC.consultMsg = self.consults[indexPath.row];
    [self.navigationController pushViewController:consultVC animated:YES];

}
@end
