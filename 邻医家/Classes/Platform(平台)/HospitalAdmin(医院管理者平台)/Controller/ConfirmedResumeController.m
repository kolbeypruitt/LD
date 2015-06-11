//
//  ConfirmedResumeController.m
//  邻医家
//
//  Created by Daniel on 15/6/4.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "ResumeCell.h"
#import "ConfirmedResumeController.h"
#import "IWCommon.h"
#import "Employer.h"
@interface ConfirmedResumeController ()

@end

@implementation ConfirmedResumeController

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
    return self.employers.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Employer *employer = [self.employers objectAtIndex:indexPath.row];
    ResumeCell *cell = [ResumeCell cellWithTableView:tableView];
    cell.employer = employer;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}
@end
