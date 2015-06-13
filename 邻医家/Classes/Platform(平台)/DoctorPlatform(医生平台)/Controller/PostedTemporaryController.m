//
//  PostedTemporaryController.m
//  邻医家
//
//  Created by Daniel on 15/6/7.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "DocTemController.h"
#import "DocGetInfoTool.h"
#import "ConsultMessage.h"
#import "QueryConsultResult.h"
#import "MJRefresh.h"
#import "PostedTemporaryController.h"

@interface PostedTemporaryController ()
@property (nonatomic,strong) NSMutableArray *consults;
@end

@implementation PostedTemporaryController
- (NSMutableArray *)consults
{
    if (_consults == nil) {
        _consults = [NSMutableArray array];
    }
    return _consults;
}
- (void)viewDidLoad {
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
    self.title = @"临时会诊";
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
    ConsultMessage *message = [self.consults objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = message.title;
    cell.detailTextLabel.text = message.createTime;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ConsultMessage *message = [self.consults objectAtIndex:indexPath.row];
    DocTemController *conVC = [[DocTemController alloc] init];
    conVC.message = message;
    [self.navigationController pushViewController:conVC animated:YES];
}
@end
