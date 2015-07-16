//
//  AllResumeViewController.m
//  邻医家
//
//  Created by Daniel on 15/6/4.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "AllResumeViewController.h"
#import "Doctor.h"
#import "IWCommon.h"
#import "DoctorCell.h"
#import "DoctorResumeController.h"
@interface AllResumeViewController ()

@end

@implementation AllResumeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.view.backgroundColor = IWColor(226, 226, 226);
}
#pragma mark - TableViewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.doctors.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DoctorCell *cell = [DoctorCell cellWithTableView:tableView];
    cell.employer = self.doctors[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DoctorResumeController  *docVC = [[DoctorResumeController alloc] init];
    docVC.employer = self.doctors[indexPath.row];
    [self.navigationController pushViewController:docVC animated:YES];
}
@end
