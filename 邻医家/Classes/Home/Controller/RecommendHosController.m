//
//  RecommendHosController.m
//  邻医家
//
//  Created by Daniel on 15/5/14.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "IWCommon.h"
#import "HomeTool.h"
#import "HosDetailController.h"
#import "MoreHosController.h"
#import "RecommendResult.h"
#import "Hospital.h"
#import "HospitalCell.h"
#import "RecommendHosController.h"
#import "LDHomeFooterView.h"
@interface RecommendHosController () <LDHomeFooterViewDelegate>
@property (nonatomic,weak) LDHomeFooterView *footerView;
@property (nonatomic,strong) NSMutableArray *hospitals;
@end
@implementation RecommendHosController
- (NSMutableArray *)hospitals
{
    if (_hospitals == nil) {
        _hospitals = [NSMutableArray array];
    }
    return _hospitals;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupTableView];
    [self loadHosData];
}
- (void)setupTableView
{
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.backgroundColor = IWColor(226, 226, 226);
}
- (void)loadHosData
{
    [HomeTool getRecommendDataWithParam:nil success:^(RecommendResult *result) {
        [self.hospitals addObjectsFromArray:result.hospitals];
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}
#pragma mark - tableview 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.hospitals.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HospitalCell *cell = [HospitalCell cellWithTableView:tableView];
    cell.hospital = self.hospitals[indexPath.row];
    return cell;
}
#pragma mark - tableview 代理方法
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    LDHomeFooterView *view = [[LDHomeFooterView alloc] init];
    [view setFooterTitle:@"更多医院"];
    view.delegate = self;
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 88;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HosDetailController *hos = [[HosDetailController alloc] init];
    hos.hospital = self.hospitals[indexPath.row];
    [self.navigationController pushViewController:hos animated:YES];
}
- (void)footerView:(LDHomeFooterView *)footerView clickedBtn:(UIButton *)button
{
    MoreHosController *moreHos = [[MoreHosController alloc] init];
    [self.navigationController pushViewController:moreHos animated:YES];
}
#pragma mark - segmentController 代理方法
- (NSString *)segmentTitle
{
    return @"推荐医院";
}
@end
