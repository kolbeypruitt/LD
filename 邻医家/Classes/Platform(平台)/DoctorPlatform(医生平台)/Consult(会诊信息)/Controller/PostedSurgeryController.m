//
//  PostedSurgeryController.m
//  邻医家
//
//  Created by Daniel on 15/6/7.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "DonConsultCell.h"
#import "MyConsultViewController.h"
#import "DocGetInfoTool.h"
#import "PostedSurgeryController.h"
#import "MJRefresh.h"
#import "ConsultMessage.h"
#import "QueryConsultResult.h"
@interface PostedSurgeryController ()
@property (nonatomic,strong) NSMutableArray *consults;
@end

@implementation PostedSurgeryController
- (NSMutableArray *)consults
{
    if (_consults == nil) {
        _consults = [NSMutableArray array];
    }
    return _consults;
}
- (void)viewDidLoad
{
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
    self.title = @"开刀";
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
