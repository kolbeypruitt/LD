//
//  FreeMessageController.m
//  邻医家
//
//  Created by Daniel on 15/6/14.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "FreeDetailMsgController.h"
#import "Common.h"
#import "FreeMessageController.h"
#import "InviteDocMsgCell.h"
#import "SDinfoListTool.h"
#import "LDBaseParam.h"
#import "InfoListResult.h"
#import "MJRefresh.h"
@interface FreeMessageController ()
@property (nonatomic,strong) NSMutableArray *inviteDocMessages;
@end

@implementation FreeMessageController
- (NSMutableArray *)inviteDocMessages
{
    if (_inviteDocMessages == nil) {
        _inviteDocMessages = [NSMutableArray array];
    }
    return _inviteDocMessages;
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
        [weakSelf loadData];
    }];
    [self.tableView.header beginRefreshing];
}
- (void)loadData
{
    LDBaseParam *param = [LDBaseParam param];
    [SDinfoListTool getSDInfoListWithParam:param success:^(InfoListResult *result) {
        if (self.inviteDocMessages.count) {
            [self.inviteDocMessages removeAllObjects];
        }
        [self.inviteDocMessages addObjectsFromArray:result.seekDoctor];
        [self.tableView reloadData];
        [self.tableView.header endRefreshing];
    } failure:^(NSError *error) {
        
    }];
}
- (void)setup
{
    self.title = @"请医信息列表";
    self.navigationItem.rightBarButtonItem = nil;
}
#pragma mark - tableview datasource and delegare method
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.inviteDocMessages.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    InviteDocMsgCell *cell = [InviteDocMsgCell cellWithTableView:tableView];
    cell.message = self.inviteDocMessages[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FreeDetailMsgController *detail = [[FreeDetailMsgController alloc] init];
    detail.message = self.inviteDocMessages[indexPath.row];
    [self.navigationController pushViewController:detail animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}
@end
