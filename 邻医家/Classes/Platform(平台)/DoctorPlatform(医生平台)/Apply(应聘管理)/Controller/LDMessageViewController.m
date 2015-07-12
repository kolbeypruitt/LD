//
//  LDMessageViewController.m
//  邻医家
//
//  Created by SXQ on 15/7/12.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDMessageCell.h"
#import "LDMessageViewController.h"
#import "Common.h"
@interface LDMessageViewController ()

@end

@implementation LDMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BGCOLOR;
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
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIButton *contactBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    contactBtn.backgroundColor = [UIColor whiteColor];
    contactBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    contactBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [contactBtn setTitle:@"联系发布人" forState:UIControlStateNormal];
    [contactBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [contactBtn addTarget:self action:@selector(contactBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    return contactBtn;
}
- (void)contactBtnClicked
{
}
@end
