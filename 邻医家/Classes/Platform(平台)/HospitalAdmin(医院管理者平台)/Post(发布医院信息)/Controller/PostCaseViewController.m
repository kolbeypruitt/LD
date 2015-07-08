//
//  PostCaseViewController.m
//  邻医家
//
//  Created by Daniel on 15/6/5.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "AppendCaseController.h"
#import "UIBarButtonItem+ENTER.h"
#import "CaseDetailController.h"
#import "PostCaseViewController.h"
#import "Common.h"
#import "LDBaseParam.h"
#import "Case.h"
#import "DiseaseCell.h"
#import "PostedCaseResult.h"
#import "PostedCaseTool.h"
#import "MJRefresh.h"
@interface PostCaseViewController ()
@property (nonatomic,strong) NSMutableArray *postedCases;
@end

@implementation PostCaseViewController
- (NSMutableArray *)postedCases
{
    if (_postedCases == nil) {
        _postedCases = [NSMutableArray array];
    }
    return _postedCases;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupRefresh];
    [self setup];
}
- (void)setupRefresh
{
    __weak typeof(self) weakSelf = self;
    [self.tableView addLegendHeaderWithRefreshingBlock:^{
        [weakSelf loadData];
    }];
    [self.tableView.header beginRefreshing];
}
- (void)setup
{
    self.view.backgroundColor = BGCOLOR;
    self.title = @"已发布病例";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(appendCase) title:@"添加"];
}
- (void)appendCase
{
    AppendCaseController *appenVC = [[AppendCaseController alloc] init];
    [self.navigationController pushViewController:appenVC animated:YES];
}
- (void)loadData
{
    LDBaseParam *param = [LDBaseParam param];
    [PostedCaseTool postedCaseWithParam:param success:^(PostedCaseResult *result) {
        if ([result.status isEqualToString:SUCCESSSTATUS]) {
            if (self.postedCases.count) {
                [self.postedCases removeAllObjects];
            }
            [self.postedCases addObjectsFromArray:result.cases];
            [self.tableView reloadData];
            [self.tableView.header endRefreshing];
        }
    } failure:^(NSError *error) {
        
    }];
}
#pragma mark - tableview delegate and datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.postedCases.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DiseaseCell *cell = [DiseaseCell cellWithTableView:tableView];
    cell.commonCase = self.postedCases[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CaseDetailController *detaiVC = [[CaseDetailController alloc] init];
    detaiVC.norcase = self.postedCases[indexPath.row];
    [self.navigationController pushViewController:detaiVC animated:YES];
}
@end



















