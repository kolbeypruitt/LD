//
//  PostedSurgeryController.m
//  邻医家
//
//  Created by Daniel on 15/6/7.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "DonConsultCell.h"
#import "DocSurgeryController.h"
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
    [self loadData];
    [self setup];
    [self setupRefresh];
}
- (void)loadData
{
    [DocGetInfoTool getGCInfoListWithParam:self.param success:^(QueryConsultResult *result) {
        [self.consults  addObjectsFromArray:result.gs];
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}
- (void)setup
{
    self.title = @"开刀";
}
- (void)setupRefresh
{
    __weak typeof (self) weakSelf = self;
    [self.tableView addLegendHeaderWithRefreshingBlock:^{
        [weakSelf refreshData];
    }];
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
    ConsultMessage *message = [self.consults objectAtIndex:indexPath.row];
    DocSurgeryController *conVC = [[DocSurgeryController alloc] init];
    conVC.message = message;
    [self.navigationController pushViewController:conVC animated:YES];
}
@end
