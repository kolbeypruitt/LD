//
//  DoctorResumeController.m
//  邻医家
//
//  Created by Daniel on 15/6/12.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "ChatViewController.h"
#import "BaseResult.h"
#import "DoctorResumeView.h"
#import "DoctorResumeController.h"
#import "Employer.h"
#import "DoctorResumeTool.h"
#import "EmployDetailParam.h"
#import "InviteDoctorTool.h"
#import "DoctorResume.h"
#import "DoctorResumeResult.h"
@interface DoctorResumeController ()<DoctorResumeViewDelegate>
@property (nonatomic,strong) DoctorResume  *resume;
@property (nonatomic,weak) DoctorResumeView *resumeView;
@end

@implementation DoctorResumeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self setup];
}
- (void)loadData
{
    EmployDetailParam *param = [EmployDetailParam paramWithId:self.employer.id];
    [DoctorResumeTool getDoctorResumeWithParam:param success:^(DoctorResumeResult *result) {
        self.resume = result.resume;
        self.resumeView.resume = result.resume;
        self.title = result.resume.name;
    } failure:^(NSError *error) {
        
    }];
}
- (void)setup
{
    self.navigationItem.rightBarButtonItem = nil;
    DoctorResumeView *resumeView = [[DoctorResumeView alloc] init];
    resumeView.frame = self.view.bounds;
    resumeView.delegate = self;
    [self.view addSubview:resumeView];
    self.resumeView = resumeView;
}
#pragma resumeView delegate
- (void)DoctorResumeView:(DoctorResumeView *)doctorView inviteBtnClicked:(UIButton *)inviteBtn
{
    EmployDetailParam *param = [EmployDetailParam paramWithId:self.resume.id];
    [InviteDoctorTool inviteDoctorWithParam:param success:^(BaseResult *result) {
        if ([result.status isEqualToString:@"S"]) {
            int count = (int)self.navigationController.viewControllers.count;
            UIViewController *VC = [self.navigationController.viewControllers objectAtIndex:count-3];
            [self.navigationController popToViewController:VC animated:YES];
        }
    } failure:^(NSError *error) {
        
    }];
    
}
- (void)doctorResumeView:(DoctorResumeView *)doctorView chatBtnClicked:(UIButton *)chatBtn
{
    ChatViewController *chatVc = [[ChatViewController alloc] init];
    chatVc.clientToChat = self.resume.clientNumber;
    [self.navigationController pushViewController:chatVc animated:YES];
}
@end






















