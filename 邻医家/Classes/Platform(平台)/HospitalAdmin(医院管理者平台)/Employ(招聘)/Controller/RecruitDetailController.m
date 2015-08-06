//
//  RecruitDetailController.m
//  邻医家
//
//  Created by Daniel on 15/6/11.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDMessage.h"
#import "LDMessageHeader.h"
#import "GetAllResumeTool.h"
#import "BaseResult.h"
#import "RecruitDetailController.h"
#import "GetAcceptedResumeTool.h"
#import "WithDrawTool.h"
#import "ConfirmedResumeController.h"
#import "GetAcceptedResult.h"
#import "GetEmployDetailTool.h"
#import "EmployDetailParam.h"
#import "Employee.h"
#import "EmployDetail.h"
#import "UIBarButtonItem+ENTER.h"
#import "MBProgressHUD+MJ.h"
@interface RecruitDetailController ()
@property (nonatomic,strong) EmployDetail *employDetail;
@property (nonatomic,weak) LDMessageHeader *headView;
@end

@implementation RecruitDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.title = @"招聘详情";
    self.singleLine = YES;
    self.tableView.sectionHeaderHeight = 0;
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(withDraw) title:@"撤销"];
}
- (void)withDraw
{
    EmployDetailParam *param = [EmployDetailParam paramWithId:self.empl.id];
    [WithDrawTool withDrawResumeWithParam:param success:^(BaseResult *result) {
        if ([result.status isEqualToString:@"S"]) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    } failure:^(NSError *error) {
        [MBProgressHUD showError:@"撤销失败!"];
    }];
}
- (void)buttonClicked:(UIButton *)button
{
    if ([button isEqual:self.headView.allBtn]) {
        EmployDetailParam *param = [EmployDetailParam paramWithId:self.empl.id];
        [GetAllResumeTool getAllResumWithParam:param success:^(GetAcceptedResult *result) {
            ConfirmedResumeController *allVC = [[ConfirmedResumeController alloc] init];
            allVC.employers = result.employers;
            allVC.title = @"所有的简历";
            [self.navigationController pushViewController:allVC animated:YES];
        } failure:^(NSError *error) {
            
        }];
    }else
    {
        EmployDetailParam *param = [EmployDetailParam paramWithId:self.empl.id];
        [GetAcceptedResumeTool getAcceptResumeWithParam:param success:^(GetAcceptedResult *result) {
            ConfirmedResumeController *acceptVC = [[ConfirmedResumeController alloc] init];
            acceptVC.employers = result.employers;
            acceptVC.title = @"已录取的简历";
            [self.navigationController pushViewController:acceptVC animated:YES];
        } failure:^(NSError *erro) {
            
        }];
    }
}

- (void)setEmpl:(Employee *)empl
{
    _empl = empl;
    EmployDetailParam *param = [EmployDetailParam paramWithId:empl.id];
    [GetEmployDetailTool getEmployDetailWithParam:param success:^(EmployDetail *result) {
        self.employDetail = result;
    } failure:^(NSError *error) {
        
    }];
}
- (void)setEmployDetail:(EmployDetail *)employDetail
{
    _employDetail = employDetail;
    
    LDMessage *message0 = [LDMessage messageWithFirstTitle:@"标题" secondTitle:employDetail.title];
    LDMessage *message1 = [LDMessage messageWithFirstTitle:@"职位性质" secondTitle:employDetail.jobtype];
    LDMessage *message2 = [LDMessage messageWithFirstTitle:@"科室" secondTitle:employDetail.department];
    LDMessage *message3 = [LDMessage messageWithFirstTitle:@"岗位" secondTitle:employDetail.jobname];
    LDMessage *message4 = [LDMessage messageWithFirstTitle:@"地点" secondTitle:employDetail.location];
    LDMessage *message5 = [LDMessage messageWithFirstTitle:@"人数" secondTitle:[NSString stringWithFormat:@"%d",employDetail.employNum]];
    LDMessage *message6 = [LDMessage messageWithFirstTitle:@"学历" secondTitle:employDetail.education];
    LDMessage *message7 = [LDMessage messageWithFirstTitle:@"外语" secondTitle:employDetail.language];
    LDMessage *message8 = [LDMessage messageWithFirstTitle:@"年龄" secondTitle:[NSString stringWithFormat:@"%d",employDetail.age]];
    LDMessage *message9 = [LDMessage messageWithFirstTitle:@"专业" secondTitle:employDetail.profession];
    LDMessage *message10 = [LDMessage messageWithFirstTitle:@"招聘条件" secondTitle:employDetail.introduction];
    LDMessage *message11 = [LDMessage messageWithFirstTitle:@"编号" secondTitle:employDetail.code];
    self.messages = @[message0,message1,message2,message3,message4,message5,message6,message7,message8,message9,message10,message11];
    
    LDMessageHeader *inviteHeader = [[LDMessageHeader alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,80)];
    [inviteHeader.acceptBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [inviteHeader.allBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    inviteHeader.empDetail = employDetail;
    self.headView = inviteHeader;
        self.tableView.tableHeaderView = inviteHeader;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

@end









