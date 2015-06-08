//
//  PostedStubbornController.m
//  邻医家
//
//  Created by Daniel on 15/6/7.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "PostedStubbornController.h"
#import "MJRefresh.h"

@interface PostedStubbornController ()

@end

@implementation PostedStubbornController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self setupRefresh];
}
- (void)setup
{
    self.title = @"疑难杂症会诊";
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
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"已发布的疑难杂症会诊信息/%ld",indexPath.row];
    
    NSDate *date = [NSDate date];
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    formater.dateFormat = @"YYYY-MM-dd HH:MM";
    NSString *dateStr = [formater stringFromDate:date];
    cell.detailTextLabel.text = dateStr;
    
    return cell;
}
@end
