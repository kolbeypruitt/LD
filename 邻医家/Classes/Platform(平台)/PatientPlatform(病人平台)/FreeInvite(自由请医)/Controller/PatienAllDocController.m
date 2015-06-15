//
//  PatienAllDocController.m
//  邻医家
//
//  Created by Daniel on 15/6/15.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "PatientDocResumeController.h"
#import "PatienAllDocController.h"
#import "AllInviteParam.h"
#import "AllInviteResult.h"
#import "AllInviteTool.h"
#import "PatienInviteDetail.h"
#import "DoctorCell.h"
#import "Common.h"
@interface PatienAllDocController ()
@property (nonatomic,strong) NSMutableArray *allDoctors;
@end

@implementation PatienAllDocController
- (NSMutableArray *)allDoctors
{
    if (_allDoctors == nil) {
        _allDoctors = [NSMutableArray array];
    }
    return _allDoctors;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self loadData];
    
}
- (void)setup
{
    self.tableView.backgroundColor = IWColor(226, 226, 226);
    self.title = @"所有简历";
    self.navigationItem.rightBarButtonItem = nil;
}
- (void)loadData
{
    AllInviteParam *param = [AllInviteParam paramWithId:self.detailMsg.id];
    [AllInviteTool allInviteDataWithParam:param success:^(AllInviteResult *result) {
        [self.allDoctors addObjectsFromArray:result.employers];
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}
#pragma mark  - TableView datatsource and delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.allDoctors.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DoctorCell *cell = [DoctorCell cellWithTableView:tableView];
    cell.employer = self.allDoctors[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Employer *emloyer = self.allDoctors[indexPath.row];
    PatientDocResumeController *docVC = [[PatientDocResumeController alloc] init];
    docVC.employer = emloyer;
    [self.navigationController pushViewController:docVC animated:YES];
}
@end
