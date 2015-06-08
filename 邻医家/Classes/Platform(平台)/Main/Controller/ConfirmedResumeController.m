//
//  ConfirmedResumeController.m
//  邻医家
//
//  Created by Daniel on 15/6/4.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "ConfirmedResumeController.h"
#import "DoctorCell.h"
#import "IWCommon.h"
#import "Doctor.h"

@interface ConfirmedResumeController ()

@end

@implementation ConfirmedResumeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.title = @"已录取的简历";
    self.view.backgroundColor = IWColor(226, 226, 226);
}
#pragma mark - TableViewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Doctor *doc = [Doctor doctorWithName:@"张幼仪" icon:nil detail:@"颈椎病专家" hospital:@"华西医院" techtitil:@"主任医师"];
    DoctorCell *cell = [DoctorCell cellWithTableView:tableView];
    cell.doctor = doc;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}
@end
