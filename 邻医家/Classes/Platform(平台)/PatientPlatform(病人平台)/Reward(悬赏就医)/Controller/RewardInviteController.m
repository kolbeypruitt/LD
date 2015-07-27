//
//  RewardInviteController.m
//  邻医家
//
//  Created by Daniel on 15/6/17.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "AppendRewardController.h"
#import "RewardDetailController.h"
#import "MBProgressHUD+MJ.h"
#import "PatientInviteDocCell.h"
#import "Common.h"
#import "InviteDocMessage.h"
#import "InfoListResult.h"
#import "InviteDocListParam.h"
#import "PatientInviteListTool.h"
#import "UIBarButtonItem+ENTER.h"
#import "RewardInviteController.h"
#import "MJRefresh.h"
@interface RewardInviteController ()
@property (nonatomic,strong) NSMutableArray *rewardList;
@end

@implementation RewardInviteController
- (NSMutableArray *)rewardList
{
    if (_rewardList == nil) {
        _rewardList = [NSMutableArray array];
    }
    return _rewardList;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupRefresh];
    [self setup];
}
- (void)setupRefresh
{
    __weak typeof(self) weakSelf = self;
    [self.tableView addLegendHeaderWithRefreshingBlock:^{
        [weakSelf loadNewData];
    }];
    
    [self.tableView.header beginRefreshing];
}
- (void)loadNewData
{
    InviteDocListParam *param = [InviteDocListParam paramWithType:2];
    [PatientInviteListTool patienInviteListWithParam:param success:^(InfoListResult *result) {
        if (self.rewardList.count) {
            [self.rewardList removeAllObjects];
        }
        [self.rewardList addObjectsFromArray:result.seekDoctor];
        [self.tableView reloadData];
        [self.tableView.header endRefreshing];
    } failure:^(NSError *error) {
        [MBProgressHUD showError:@"请求失败!"];
        [self.tableView.header endRefreshing];
    }];
}
- (void)setup
{
    self.title = @"悬赏请医";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(appendReward) title:@"病情描述"];
    [DefaultCenter addObserver:self selector:@selector(refreshData) name:FREEINVITENEEDREFRESHNOTIFICATION object:nil];
}
- (void)dealloc
{
    [DefaultCenter removeObserver:self];
}
- (void)refreshData
{
    [self.tableView.header beginRefreshing];
}
- (void)appendReward
{
    AppendRewardController *apvc = [[AppendRewardController alloc] init];
    [self.navigationController pushViewController:apvc animated:YES];
}

#pragma mark - TableView datasource and delegate method
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.rewardList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PatientInviteDocCell *cell = [PatientInviteDocCell cellWithTableView:tableView];
    cell.message = self.rewardList[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RewardDetailController *rewardVC = [[RewardDetailController alloc] init];
    rewardVC.message = [self.rewardList objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:rewardVC animated:YES];
}

@end













