//
//  MoreDocController.m
//  邻医家
//
//  Created by Daniel on 15/5/4.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "AccountTool.h"
#import "LoginDocDetailController.h"
#import "SearchDoctorParam.h"
#import "SearchDoctorTool.h"
#import "SearchDoctorResult.h"
#import "DoctorDetailController.h"
#import "Common.h"
#import "MoreDocController.h"
#import "SearchDoctorController.h"
#import "DoctorCell.h"
#import "Doctor.h"
#import "IWCommon.h"
#import "MJRefresh.h"
#import "MBProgressHUD+MJ.h"
@interface MoreDocController () <UISearchBarDelegate>
@property (nonatomic,strong) NSMutableArray *doctors;
@property (nonatomic,weak) UISearchBar *searchBar;
@end

@implementation MoreDocController
- (NSMutableArray *)doctors
{
    if (_doctors == nil) {
        _doctors = [NSMutableArray array];
    }
    return _doctors;
}
- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [super initWithStyle:UITableViewStyleGrouped];
}
- (void)setParam:(SearchDoctorParam *)param
{
    _param = param;
    [SearchDoctorTool searchDoctorWithParam:param success:^(SearchDoctorResult *result) {
        if ([result.status isEqualToString:SUCCESSSTATUS]) {
            if (self.doctors.count) {
                [self.doctors removeAllObjects];
            }
            [self.doctors addObjectsFromArray:result.doctors];
            [self.tableView reloadData];
        }else
        {
            [MBProgressHUD showError:@"请重新搜索"];
        }
    } failure:^(NSError *error) {
        
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self loadData];
    [self setupTableHeader];
    [self setupRefresh];
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
- (void)loadData
{
    SearchDoctorParam *param = [[SearchDoctorParam alloc] init];
    param.lastId = 0;
    param.num = 10;
    self.param = param;
}
- (void)setup
{
    self.title = @"医生列表";
    self.navigationItem.rightBarButtonItem = nil;
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    [self.tableView registerClass:[DoctorCell class] forCellReuseIdentifier:DOCID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.backgroundColor = IWColor(226, 226, 226);
}
- (void)setupTableHeader
{
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 74, self.view.frame.size.width, 30)];
    searchBar.delegate = self;
    searchBar.placeholder = @"医生名字";
    self.searchBar = searchBar;
    self.tableView.tableHeaderView = searchBar;
}
#pragma mark - Tableview delegate method
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.doctors.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DoctorCell *cell = [DoctorCell cellWithTableView:tableView];
    cell.doctor = self.doctors[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 88;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    BOOL islogin = [AccountTool isLogin];
//    if (islogin) {
    
            LoginDocDetailController *docVC = [[LoginDocDetailController alloc] init];
            docVC.doctor = self.doctors[indexPath.row];
            docVC.isDoctor = NO;
            [self.navigationController pushViewController:docVC animated:YES];
//        }else
//        {
//            DoctorDetailController *docVC = [[DoctorDetailController alloc] init];
//            docVC.doctor = self.doctors[indexPath.row];
//            [self.navigationController pushViewController:docVC animated:YES];
//        }
    
}
#pragma mark - searchBar delegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    SearchDoctorController *searchVC = [[SearchDoctorController alloc] init];
    [self.navigationController pushViewController:searchVC animated:YES];
    return NO;
}


- (void)loadMoreData
{
    Doctor *lastDoctor = [self.doctors lastObject];
    self.param.lastId = lastDoctor.id;
    [SearchDoctorTool searchDoctorWithParam:self.param success:^(SearchDoctorResult *result) {
        [self.doctors addObjectsFromArray:result.doctors];
        [self.tableView.footer endRefreshing];
        [self.tableView.header endRefreshing];
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}

@end










