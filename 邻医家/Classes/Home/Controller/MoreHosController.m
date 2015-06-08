//
//  MoreHosController.m
//  邻医家
//
//  Created by Daniel on 15/5/11.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "MoreHosController.h"
#import "HosDetailController.h"
#import "Common.h"
#import "SearchHosController.h"
#import "Hospital.h"
#import "HospitalCell.h"
#import "MJRefresh.h"
#import "IWCommon.h"
@interface MoreHosController () <UISearchBarDelegate>
@property (nonatomic,weak) UISearchBar *searchBar;
@end

@implementation MoreHosController
- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self setTableHeader];
    [self setupRefresh];
}
- (void)setupRefresh
{
    __weak typeof(self) weakSelf = self;
    [self.tableView addLegendHeaderWithRefreshingBlock:^{
        [weakSelf loadMoreData];
    }];
}
- (void)setup
{
    self.title = @"医院列表";
//    self.tableView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.backgroundColor = IWColor(226, 226, 226);
    
    [self.tableView registerClass:[HospitalCell class] forCellReuseIdentifier:HOSID];
}

- (void)setTableHeader
{
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 74, self.view.frame.size.width, 30)];
    searchBar.delegate = self;
    searchBar.placeholder = @"热门地区/热门科室/重要专家/关键字";
    self.searchBar = searchBar;
    self.tableView.tableHeaderView = searchBar;   
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Hospital *hos = [Hospital hospitalWithName:@"湘雅附二" detail:@"中西医结合治疗各种疾病"];
    HospitalCell *cell = [HospitalCell cellWithTableView:tableView];
    cell.hospital = hos;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 88;
}
#pragma mark - tableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Hospital *hos = [Hospital hospitalWithName:@"湘雅附二" detail:@"中西医结合治疗各种疾病"];
    HosDetailController *hosDetailVC = [[HosDetailController alloc] init];
    hosDetailVC.hospital = hos;
    [self.navigationController pushViewController:hosDetailVC animated:YES];
}
#pragma mark - searchBar delegate method
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    SearchHosController *searchVC = [[SearchHosController alloc] init];
    [self.navigationController pushViewController:searchVC animated:YES];
    return NO;
}
/**
 *  刷新控件进入开始刷新状态的时候调用
 */


- (void)loadMoreData
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.header endRefreshing];
    });
}
- (void)loadNewData
{
}
@end


















