//
//  FreeInviteController.m
//  邻医家
//
//  Created by Daniel on 15/6/7.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "InviteDocMessage.h"
#import "InviteDocMsgCell.h"
#import "AppendInviteViewController.h"
#import "FreeInviteController.h"
#import "InviteDetailController.h"
#import "Common.h"
#import "UIBarButtonItem+ENTER.h"
#import "InfoListResult.h"
#import "InviteDocListParam.h"
#import "PatientInviteListTool.h"
@interface FreeInviteController ()
@property (nonatomic,strong) NSMutableArray *inviteDocList;
@end

@implementation FreeInviteController
- (NSMutableArray *)inviteDocList
{
    if (_inviteDocList == nil) {
        _inviteDocList = [NSMutableArray array];
    }
    return _inviteDocList;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self setup];
}
- (void)loadData
{
    InviteDocListParam *param = [InviteDocListParam paramWithType:1];
    [PatientInviteListTool patienInviteListWithParam:param success:^(InfoListResult *result) {
        [self.inviteDocList addObjectsFromArray:result.seekDoctor];
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}
- (void)setup
{
    self.title = @"自由请医";
    [self setNav];
}
- (void)setNav
{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self
                                                                      action:@selector(addInviteMessage)
                                                                       title:@"添加"];
}
- (void)addInviteMessage
{
    AppendInviteViewController *append = [[AppendInviteViewController alloc] init];
    [self.navigationController pushViewController:append animated:YES];
}
#pragma mark - Table Datasource and Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.inviteDocList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    InviteDocMsgCell *cell = [InviteDocMsgCell cellWithTableView:tableView];
    cell.message = [self.inviteDocList objectAtIndex:indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    InviteDetailController *invite = [[InviteDetailController alloc] init];
    invite.message = [self.inviteDocList objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:invite animated:YES];
}
@end
