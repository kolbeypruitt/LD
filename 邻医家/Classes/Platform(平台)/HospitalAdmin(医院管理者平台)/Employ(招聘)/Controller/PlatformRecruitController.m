//
//  PlatformRecruitController.m
//  邻医家
//
//  Created by Daniel on 15/6/1.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "PlatformRecruitController.h"
#import "GetEmployeeResult.h"
#import "Common.h"
#import "ConsultDetailController.h"
#import "UIBarButtonItem+ENTER.h"
#import "LDBaseParam.h"
#import "EmployeeCell.h"
#import "Employee.h"
#import "GetEmployTool.h"
#import "RecruitDetailController.h"
@interface PlatformRecruitController ()
@property (nonatomic,strong) NSMutableArray *employees;
@end

@implementation PlatformRecruitController
- (NSMutableArray *)employees
{
    if (_employees == nil) {
        _employees = [NSMutableArray array];
    }
    return _employees;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self setup];
}
- (void)loadData
{
    LDBaseParam *param = [LDBaseParam param];
    [GetEmployTool getEmployWithParam:param success:^(GetEmployeeResult *result) {
        [self.employees addObjectsFromArray:result.employs];
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}
- (void)setup
{
    self.title = @"招聘";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:nil title:@"提交"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.employees.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EmployeeCell *cell = [EmployeeCell cellWithTableView:tableView];
    cell.emp = self.employees[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RecruitDetailController *detailVC = [[RecruitDetailController alloc] init];
    detailVC.empl = self.employees[indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
}
@end
