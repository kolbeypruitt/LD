//
//  MyConsultController.m
//  邻医家
//
//  Created by Daniel on 15/7/10.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "MyConsultViewController.h"
#import "MyConsultController.h"
#import "ApplianTool.h"
#import "DonConsultCell.h"
#import "ConsultMessage.h"
#import "QueryConsultResult.h"
@interface MyConsultController ()
@property (nonatomic,strong) NSArray *messages;
@end

@implementation MyConsultController
- (NSArray *)messages
{
    if (_messages == nil) {
        _messages = [NSArray array];
    }
    return _messages;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self setup];
}
- (void)loadData
{
    [ApplianTool myConsultSuccess:^(QueryConsultResult *result) {
        if ([result.status isEqualToString:@"S"]) {
            self.messages = result.gs;
            [self.tableView reloadData];
        }
    } failure:^(NSError *error) {
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [self setup];
}
- (void)setup
{
    self.title = @"已应聘的会诊列表";
}
#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.messages.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DonConsultCell *cell = [DonConsultCell cellWithTable:tableView];
    cell.message = self.messages[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 66;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyConsultViewController *myVC = [[MyConsultViewController alloc] init];
    myVC.consultMsg = self.messages[indexPath.row];
    [self.navigationController pushViewController:myVC animated:YES];
}
@end
