//
//  RecommendDocController.m
//  邻医家
//
//  Created by Daniel on 15/5/14.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "IWCommon.h"
#import "MoreDocController.h"
#import "DoctorDetailController.h"
#import "Doctor.h"
#import "DoctorCell.h"
#import "HomeTool.h"
#import "RecommendResult.h"
#import "RecommendDocController.h"
#import "LDHomeFooterView.h"
@interface RecommendDocController () <LDHomeFooterViewDelegate>
@property (nonatomic,strong) NSMutableArray *doctors;
@property (nonatomic,weak) LDHomeFooterView *footerView;
@end
@implementation RecommendDocController
- (NSMutableArray *)doctors
{
    if (_doctors == nil) {
        _doctors = [NSMutableArray array];
    }
    return _doctors;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupTableView];
    [self loadDocData];
}
- (void)loadDocData
{
    [HomeTool getRecommendDataWithParam:nil success:^(RecommendResult *result) {
        [self.doctors addObjectsFromArray:result.doctors];
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}
- (void)setupTableView
{
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.backgroundColor = IWColor(226, 226, 226);
}
#pragma mark - tableview 数据源方法
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
#pragma mark - tableview 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DoctorDetailController *docVC = [[DoctorDetailController alloc] init];
    docVC.doctor = self.doctors[indexPath.row];
    [self.navigationController pushViewController:docVC animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 30;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    LDHomeFooterView *view = [[LDHomeFooterView alloc] init];
    [view setFooterTitle:@"更多医生"];
    view.delegate = self;
    return view;
}
#pragma mark - footer delegate method
- (void)footerView:(LDHomeFooterView *)footerView clickedBtn:(UIButton *)button
{
    MoreDocController *moreDoc = [[MoreDocController alloc] init];
    [self.navigationController pushViewController:moreDoc animated:YES];
}
#pragma mark - segmentController 代理方法
- (NSString *)segmentTitle
{
    return @"推荐医生";
}

@end








