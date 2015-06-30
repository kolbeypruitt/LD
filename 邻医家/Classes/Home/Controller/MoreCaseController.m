//
//  MoreCaseController.m
//  邻医家
//
//  Created by Daniel on 15/6/30.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "Common.h"
#import "MoreCaseController.h"
#import "DiseaseCell.h"
#import "CaseDetailController.h"
#import "SearchCaseController.h"
#import "Case.h"
#import "SearchCaseParam.h"
#import "SearchCaseResult.h"
#import "SearchCaseTool.h"
#import "MJRefresh.h"
@interface MoreCaseController ()<UISearchBarDelegate>
@property (nonatomic,strong) NSMutableArray *cases;
@property (nonatomic,weak) UISearchBar *searchBar;
@end

@implementation MoreCaseController
- (NSMutableArray *)cases
{
    if (_cases == nil) {
        _cases = [NSMutableArray array];
    }
    return _cases;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self loadData];
}
- (void)loadData
{
    SearchCaseParam *param = [[SearchCaseParam alloc] init];
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
    self.title = @"重要病例";
    self.navigationItem.rightBarButtonItem = nil;
    self.view.backgroundColor = BGCOLOR;
    [self setupSearchBar];
}
- (void)setupSearchBar
{
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 74, self.view.frame.size.width, 30)];
    searchBar.delegate = self;
    searchBar.placeholder = @"/热门科室/关键字";
    self.searchBar = searchBar;
    self.tableView.tableHeaderView = searchBar;
    
}
- (void)loadMoreData
{
    Case *lastCase = [self.cases lastObject];
    self.param.lastId = lastCase.id;
}
- (void)setParam:(SearchCaseParam *)param
{
    _param = param;
    [SearchCaseTool searchCaseWithParam:param success:^(SearchCaseResult *result) {
        if ([result.status isEqualToString:@"S"]) {
            if (self.cases.count) {
                [self.cases removeAllObjects];
            }
            [self.cases addObjectsFromArray:result.cases];
            [self.tableView reloadData];
        }
    } failure:^(NSError *error) {
        
    }];
}
#pragma mark - tableview delegate method
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cases.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DiseaseCell *cell = [DiseaseCell cellWithTableView:tableView];
    cell.commonCase = self.cases[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 88;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CaseDetailController *caseVC = [[CaseDetailController alloc] init];
    caseVC.norcase = self.cases[indexPath.row];
    [self.navigationController pushViewController:caseVC animated:YES];
}
#pragma mark - searchBar delegate method
-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    SearchCaseController *searVC = [[SearchCaseController alloc] init];
    [self.navigationController pushViewController:searVC animated:YES];
    return NO;
}
@end
