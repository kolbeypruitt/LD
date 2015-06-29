//
//  MoreHosController.m
//  邻医家
//
//  Created by Daniel on 15/5/11.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "SearchHosController.h"
#import "MoreHosController.h"
#import "LoginHosController.h"
#import "AccountTool.h"
#import "HosDetailController.h"
#import "Common.h"
#import "Hospital.h"
#import "HospitalCell.h"
#import "MJRefresh.h"
#import "IWCommon.h"
#import "SearchHosParam.h"
#import "SearchHosResult.h"
#import "SearchHosTool.h"
@interface MoreHosController () <UISearchBarDelegate>
@property (nonatomic,weak) UISearchBar *searchBar;
@property (nonatomic,strong) NSMutableArray *hospitals;
@end

@implementation MoreHosController
- (NSMutableArray *)hospital
{
    if (_hospitals == nil) {
        _hospitals = [NSMutableArray array];
    }
    return _hospitals;
}
- (void)setParam:(SearchHosParam *)param
{
    _param = param;
    [SearchHosTool searchHosWithParam:param success:^(SearchHosResult *result) {
        if ([result.status isEqualToString:@"S"]) {
            self.hospitals = result.hospitals;
            [self.tableView reloadData];
        }
    } failure:^(NSError *error) {
        
    }];
    
}
- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self setup];
    [self setTableHeader];
    [self setupRefresh];
}
- (void)loadData
{
    SearchHosParam *param = [[SearchHosParam alloc] init];
    param.lastId = 0;
    param.num = 10;
    self.param = param;
}
- (void)setupRefresh
{
    __weak typeof(self) weakSelf = self;
    [self.tableView addLegendHeaderWithRefreshingBlock:^{
        [weakSelf loadMoreData];
    }];
    
    [self.tableView addLegendFooterWithRefreshingBlock:^{
        [weakSelf loadMoreData];
    }];
}
- (void)setup
{
    self.title = @"医院列表";
//    self.tableView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
    self.navigationItem.rightBarButtonItem = nil;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.backgroundColor = BGCOLOR;
    
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
   return  self.hospitals.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HospitalCell *cell = [HospitalCell cellWithTableView:tableView];
    cell.hospital = self.hospitals[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 88;
}
#pragma mark - tableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL islogin = [AccountTool isLogin];
    if (islogin) {
            LoginHosController *hos = [[LoginHosController alloc] init];
            hos.hospital = self.hospitals[indexPath.row];
            [self.navigationController pushViewController:hos animated:YES];
        }else
        {
            HosDetailController *hos = [[HosDetailController alloc] init];
            hos.hospital = self.hospitals[indexPath.row];
            [self.navigationController pushViewController:hos animated:YES];
        }
    
}
#pragma mark - searchBar delegate method
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    SearchHosController *searchHosVc = [[SearchHosController alloc] init];
    [self.navigationController pushViewController:searchHosVc animated:YES];
    return NO;
}
/**
 *  刷新控件进入开始刷新状态的时候调用
 */


- (void)loadMoreData
{
    Hospital *lastHospital = [self.hospitals lastObject];
    self.param.lastId = lastHospital.id;
    [SearchHosTool searchHosWithParam:self.param success:^(SearchHosResult *result) {
        [self.hospitals addObjectsFromArray:result.hospitals];
        [self.tableView.footer endRefreshing];
        [self.tableView.header endRefreshing];
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}
@end

















