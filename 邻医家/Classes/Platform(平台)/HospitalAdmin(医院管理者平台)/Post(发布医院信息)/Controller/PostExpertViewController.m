//
//  PostExpertViewController.m
//  邻医家
//
//  Created by Daniel on 15/6/5.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "PostExpertViewController.h"
#import "Common.h"
#import "ArrangementDetailController.h"
#import "ArrangementCell.h"
#import "DocArrangeListTool.h"
#import "UIBarButtonItem+ENTER.h"
#import "MJRefresh.h"
#import "LDNotification.h"
#import "AppendArrangementController.h"
#import "ArrangeListResult.h"
#import "Arrangement.h"
@interface PostExpertViewController ()
@property (nonatomic,strong) NSMutableArray *arrangements;
@end

@implementation PostExpertViewController
- (NSMutableArray *)arrangements
{
    if (_arrangements == nil) {
        _arrangements = [NSMutableArray array];
    }
    return _arrangements;
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
- (void)refreshData
{
    [self.tableView.header beginRefreshing];
}
- (void)loadData
{
    [DocArrangeListTool docArrangeListSuccess:^(ArrangeListResult *result) {
        if ([result.status isEqualToString:SUCCESSSTATUS]) {
            [self.tableView.header endRefreshing];
            if (self.arrangements.count) {
                [self.arrangements removeAllObjects];
            }
            [self.arrangements addObjectsFromArray:result.arrangements];
            [self.tableView reloadData];
        }
    } failure:^(NSError *error) {
        
    }];
}
- (void)setup
{
    self.title = @"已发布专家坐诊";
    [DefaultCenter addObserver:self selector:@selector(refreshData) name:RELEASEARRANGESUCCESSNOTIFICATION object:nil];
    [self setNav];
}
- (void)dealloc
{
    [DefaultCenter removeObserver:self];
}
- (void)setNav
{
    self.view.backgroundColor = IWColor(226, 226, 226);
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(addExpert) title:@"添加"];
}
- (void)addExpert
{
    AppendArrangementController *appendVC = [[AppendArrangementController alloc] init];
    [self.navigationController pushViewController:appendVC animated:YES];
}
#pragma mark - tabelView delegate and datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrangements.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ArrangementCell *cell = [ArrangementCell cellWithTableView:tableView];
    cell.arrangement = self.arrangements[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 74;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ArrangementDetailController *arrangementVC = [[ArrangementDetailController alloc] init];
    arrangementVC.arrangement = self.arrangements[indexPath.row];
    [self.navigationController pushViewController:arrangementVC animated:YES];
}
@end

























