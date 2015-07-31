//
//  LDMessageController.m
//  邻医家
//
//  Created by Daniel on 15/7/13.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDMessage.h"
#import "LDMessageCell.h"
#import "LDMessageController.h"
#import "Common.h"
#import "ChatViewController.h"
@interface LDMessageController ()

@end

@implementation LDMessageController
- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [super initWithStyle:UITableViewStyleGrouped];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BGCOLOR;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
- (void)setMessages:(NSArray *)messages
{
    _messages = messages;
    [self.tableView reloadData];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messages.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    LDMessageCell *cell = [LDMessageCell cellWithTableView:tableView];
    cell.message = self.messages[indexPath.row];
    cell.singleLine = self.singleLine;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.singleLine) {
        return 40;
    }else
    {
        return 60;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIButton *contactBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    contactBtn.backgroundColor = [UIColor whiteColor];
    contactBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    contactBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [contactBtn setTitle:@"联系发布人" forState:UIControlStateNormal];
    [contactBtn setTitleColor:IWColor(88, 202, 203) forState:UIControlStateNormal];
    [contactBtn addTarget:self action:@selector(contactBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    return contactBtn;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return   40;
}
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}
- (void)contactBtnClicked
{
    ChatViewController *chatVc = [[ChatViewController alloc] init];
    chatVc.clientToChat = self.clientToChat;
    [self.navigationController pushViewController:chatVc animated:YES];
}
@end
