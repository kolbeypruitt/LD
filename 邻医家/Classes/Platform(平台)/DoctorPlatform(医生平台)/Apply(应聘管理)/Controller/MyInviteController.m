//
//  MyInviteController.m
//  邻医家
//
//  Created by Daniel on 15/7/10.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "MyInviteDetailController.h"
#import "MyInviteController.h"
#import "ApplianTool.h"
#import "InfoListResult.h"
#import "InviteDocMessage.h"
#import "InviteDocMsgCell.h"
@interface MyInviteController ()
@property (nonatomic,strong) NSMutableArray *inviteList;
@end

@implementation MyInviteController
- (NSMutableArray *)inviteList
{
    if (_inviteList == nil) {
        _inviteList = [NSMutableArray array];
    }
    return _inviteList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self setup];
}
- (void)loadData
{
    [ApplianTool myInviteSuccess:^(InfoListResult *result) {
        if ([result.status isEqualToString:@"S"]) {
            [self.inviteList addObjectsFromArray:result.seekDoctor];
            [self.tableView reloadData];
        }
    } failure:^(NSError *error) {
        
    }];
}
- (void)setup
{
    self.title = @"已应聘的请医列表";
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.inviteList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    InviteDocMsgCell *cell = [InviteDocMsgCell cellWithTableView:tableView];
    cell.message = self.inviteList[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyInviteDetailController *detailVC = [[MyInviteDetailController alloc] init];
    detailVC.inviteDocMessage = self.inviteList[indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
}
@end











