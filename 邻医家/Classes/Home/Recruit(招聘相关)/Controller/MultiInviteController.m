//
//  MultiInviteController.m
//  邻医家
//
//  Created by Daniel on 15/6/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "SearchRecruitTool.h"
#import "MultiInviteCell.h"
#import "RecruitParam.h"
#import "MultiInviteController.h"
#import "MultiInviteDetailController.h"
#import "RecruitTool.h"
#import "RecruitResult.h"
#import "EmployInfo.h"
#import "SearchDepartmentController.h"
#import "LDNotification.h"  
#import "Common.h"
@interface MultiInviteController () <UISearchBarDelegate>
@property (nonatomic,strong) NSMutableArray *employInfos;
@property (nonatomic,weak) UISearchBar *searcherBar;
@end

@implementation MultiInviteController
- (NSMutableArray *)employInfos
{
    if (_employInfos == nil) {
        _employInfos = [NSMutableArray array];
    }
    return _employInfos;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setType:(int)type
{
    _type = type;
    
    RecruitParam *param = [RecruitParam paramWithType:type];
    [RecruitTool recruitWithParam:param success:^(RecruitResult *result) {
        if ([result.status isEqualToString:@"S"]) {
            [self.employInfos addObjectsFromArray:result.employInfos];
            [self.tableView reloadData];
        }
    } failure:^(NSError *error) {
        
    }];
}
- (void)setup
{
 
    self.navigationItem.rightBarButtonItem = nil;
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 30)];
    searchBar.placeholder = @"搜索科室";
    searchBar.delegate = self;
    self.tableView.tableHeaderView = searchBar;
    self.searcherBar = searchBar;
    
    [DefaultCenter addObserver:self selector:@selector(searchDepartment:) name:DEPARTMENTCHOOSEDNOTIFICATION object:nil];
}
- (void)dealloc
{
    [DefaultCenter removeObserver:self];
}
- (void)searchDepartment:(NSNotification *)notification
{
    self.searcherBar.text = notification.userInfo[@"depName"];
    RecruitParam *param = [RecruitParam paramWithType:self.type andDepartments:notification.userInfo[@"department"]];
    [SearchRecruitTool searchRecruitWithParam:param success:^(RecruitResult *result) {
        if ([result.status isEqualToString:@"S"]) {
            if (self.employInfos.count) {
                [self.employInfos removeAllObjects];
            }
            [self.employInfos addObjectsFromArray:result.employInfos];
            [self.tableView reloadData];
        }
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark - tableview delegate and datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.employInfos.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MultiInviteCell *cell = [MultiInviteCell cellWithTableView:tableView];
    cell.employInfo = self.employInfos[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MultiInviteDetailController *detaiVC = [[MultiInviteDetailController alloc] init];
    detaiVC.title = self.title;
    detaiVC.employInfo = self.employInfos[indexPath.row];
    [self.navigationController pushViewController:detaiVC animated:YES];
}
#pragma mark - searchbar delegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    SearchDepartmentController *searchVC = [[SearchDepartmentController alloc] init];
    searchVC.title = [NSString stringWithFormat:@"搜索%@",self.title];
    [self.navigationController pushViewController:searchVC animated:YES];
    
    return NO;
}
@end










