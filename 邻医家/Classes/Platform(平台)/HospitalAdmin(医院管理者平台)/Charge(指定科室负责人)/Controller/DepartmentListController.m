//
//  DepartmentListController.m
//  邻医家
//
//  Created by Daniel on 15/7/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDNotification.h"
#import "DepartmentManagerCell.h"
#import "DepartmentListController.h"
#import "Common.h"
#import "UIBarButtonItem+ENTER.h"
#import "AssignDepartmentController.h"
#import "DepartmentListTool.h"
#import "LDBaseParam.h"
#import "DepartmentListResult.h"
#import "DepartmentManager.h"
#import "ManagerDetailController.h"
#import "MJRefresh.h"
@interface DepartmentListController ()
@property (nonatomic,strong) NSMutableArray *departmentManagers;
@end

@implementation DepartmentListController
- (NSMutableArray *)departmentManagers
{
    if (_departmentManagers == nil) {
        _departmentManagers = [NSMutableArray array];
    }
    return _departmentManagers;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self setupRefresh];
}
- (void)setupRefresh
{
    __weak typeof(self) weakSelf = self;
    [self.tableView addLegendHeaderWithRefreshingBlock:^{
        [weakSelf loadData];
    }];
    [self.tableView.header beginRefreshing];
}
//加载数据
- (void)loadData
{
    [DepartmentListTool departmentListWithParam:[LDBaseParam param] success:^(DepartmentListResult *result) {
        if ([result.status isEqualToString:@"S"]) {
            if (self.departmentManagers.count) {
                    [self.departmentManagers removeAllObjects];
                }
            [self.departmentManagers addObjectsFromArray:result.departments];
            [self.tableView reloadData];
            [self.tableView.header endRefreshing];
        }
    } failure:^(NSError *error) {
        
    }];
}
- (void)setup
{
    self.title = @"科室主任列表";
    self.view.backgroundColor = BGCOLOR;
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(appendDepartment) title:@"添加"];
    [DefaultCenter addObserver:self selector:@selector(refreshData) name:MANAGERLISTREFRESHNOTIFICATION object:nil];
}
- (void)dealloc
{
    [DefaultCenter removeObserver:self];
}
- (void)refreshData
{
    [self.tableView.header beginRefreshing];
}

- (void)appendDepartment
{
    AssignDepartmentController *assignVC = [[AssignDepartmentController alloc] init];
    [self.navigationController pushViewController:assignVC animated:YES];
}
#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.departmentManagers.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DepartmentManagerCell *cell = [DepartmentManagerCell cellWithTableView:tableView];
    cell.manager = self.departmentManagers[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 74;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ManagerDetailController *managerVC = [[ManagerDetailController alloc] init];
    managerVC.manager = self.departmentManagers[indexPath.row];
    [self.navigationController pushViewController:managerVC animated:YES];
}
@end
















