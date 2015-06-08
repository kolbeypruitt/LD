//
//  MoreDocController.m
//  邻医家
//
//  Created by Daniel on 15/5/4.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "DoctorDetailController.h"
#import "Common.h"
#import "MoreDocController.h"
#import "SearchHosController.h"
#import "DoctorCell.h"
#import "Doctor.h"
#import "IWCommon.h"
#import "MJRefresh.h"
@interface MoreDocController () <UISearchBarDelegate>
@property (nonatomic,weak) UISearchBar *searchBar;
@end

@implementation MoreDocController
- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [super initWithStyle:UITableViewStyleGrouped];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self setupTableHeader];
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
    self.title = @"医生列表";
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    [self.tableView registerClass:[DoctorCell class] forCellReuseIdentifier:DOCID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.backgroundColor = IWColor(226, 226, 226);
}
- (void)setupTableHeader
{
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 74, self.view.frame.size.width, 30)];
    searchBar.delegate = self;
    searchBar.placeholder = @"热门地区/热门科室/重要专家/关键字";
    self.searchBar = searchBar;
    self.tableView.tableHeaderView = searchBar;
}
#pragma mark - Tableview delegate method
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DoctorCell *cell = [DoctorCell cellWithTableView:tableView];
    Doctor *doc = [Doctor doctorWithName:@"莫文蔚" icon:nil detail:@"博士，教授，著名专家，中西医结合治疗各种疾病" hospital:@"湘雅医院" techtitil:@"主任医师"];
    cell.doctor = doc;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 88;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Doctor *doc = [Doctor doctorWithName:@"莫文蔚" icon:nil detail:@"博士，教授，著名专家，中西医结合治疗各种疾病" hospital:@"湘雅医院" techtitil:@"主任医师"];
    DoctorDetailController *docVC = [[DoctorDetailController alloc] init];
    docVC.doctor = doc;
    [self.navigationController pushViewController:docVC animated:YES];
    
}
#pragma mark - searchBar delegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    SearchHosController *searchVC = [[SearchHosController alloc] init];
    [self.navigationController pushViewController:searchVC animated:YES];
    return NO;
}


- (void)loadMoreData
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.header endRefreshing];
    });
}
- (void)loadNewData
{
}
@end










