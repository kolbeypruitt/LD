//
//  AcceptedDocController.m
//  邻医家
//
//  Created by Daniel on 15/6/15.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "DoctorResumeController.h"
#import "Common.h"
#import "DoctorCell.h"
#import "PatienInviteDetail.h"
#import "AcceptedDocController.h"
#import "AllInviteResult.h"
#import "AllInviteParam.h"
#import "ConfirmedInviteTool.h"
@interface AcceptedDocController ()
@property (nonatomic,strong) NSMutableArray *confirmedDoctors;
@end

@implementation AcceptedDocController
- (NSMutableArray *)confirmedDoctors
{
    if (_confirmedDoctors == nil) {
        _confirmedDoctors = [NSMutableArray array];
    }
    return _confirmedDoctors;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self setup];
}
- (void)setup
{
    self.tableView.backgroundColor = IWColor(226, 226, 226);
    self.title = @"已录取的简历";
    self.navigationItem.rightBarButtonItem = nil;
}

- (void)loadData
{
    AllInviteParam *param = [AllInviteParam paramWithId:self.detailMsg.id];
    [ConfirmedInviteTool confirmedInviteDataWithParam:param success:^(AllInviteResult *result) {
        [self.confirmedDoctors addObjectsFromArray:result.employers];
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.confirmedDoctors.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DoctorCell *cell = [DoctorCell cellWithTableView:tableView];
    cell.employer = self.confirmedDoctors[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Employer *emloyer = self.confirmedDoctors[indexPath.row];
    DoctorResumeController *docVC = [[DoctorResumeController alloc] init];
    docVC.employer = emloyer;
    [self.navigationController pushViewController:docVC animated:YES];
}
@end

