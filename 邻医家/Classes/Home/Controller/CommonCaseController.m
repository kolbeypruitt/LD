//
//  CommonCaseController.m
//  邻医家
//
//  Created by Daniel on 15/5/14.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "Case.h"
#import "DiseaseCell.h"
#import "RecommendResult.h"
#import "HomeTool.h"
#import "IWCommon.h"
#import "CommonCaseController.h"
@interface CommonCaseController ()
@property (nonatomic,strong) NSMutableArray *diseases;
@end
@implementation CommonCaseController
- (NSMutableArray *)diseases
{
    if (_diseases == nil) {
        _diseases = [NSMutableArray array];
    }
    return _diseases;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupTableView];
    [self loadDisData];
}
- (void)setupTableView
{
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.backgroundColor = IWColor(226, 226, 226);
}
- (void)loadDisData
{
    [HomeTool getRecommendDataWithParam:nil success:^(RecommendResult *result) {
        [self.diseases addObjectsFromArray:result.cases];
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}
#pragma mark - tableview 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.diseases.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DiseaseCell *cell = [DiseaseCell cellWithTableView:tableView];
    cell.commonCase = self.diseases[indexPath.row];
    return cell;
}
#pragma mark - tableview 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 88;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
#pragma mark - segmentController 代理方法
- (NSString *)segmentTitle
{
    return @"常见病例";
}
@end








