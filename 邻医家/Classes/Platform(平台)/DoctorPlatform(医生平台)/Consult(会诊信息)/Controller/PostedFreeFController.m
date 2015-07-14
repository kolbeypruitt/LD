//
//  PostedFreeFController.m
//  邻医家
//
//  Created by Daniel on 15/6/7.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "DonConsultCell.h"
#import "MyConsultViewController.h"
#import "DocGetInfoTool.h"
#import "ConsultMessage.h"
#import "QueryConsultResult.h"
#import "PostedFreeFController.h"
#import "MJRefresh.h"

@interface PostedFreeFController ()
@property (nonatomic,strong) NSMutableArray *consults;
@end

@implementation PostedFreeFController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupRefresh];
    [self setup];
}
- (NSMutableArray *)consults
{
    if (_consults == nil) {
        _consults = [NSMutableArray array];
    }
    return _consults;
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
    self.title = @"自由转诊";
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
