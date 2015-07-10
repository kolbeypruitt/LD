//
//  PatientDocResumeController.m
//  邻医家
//
//  Created by Daniel on 15/6/15.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "ChatViewController.h"
#import "MBProgressHUD+MJ.h"
#import "BaseResult.h"
#import "DoctorResumeView.h"
#import "Employer.h"
#import "DoctorResume.h"
#import "DoctorResumeResult.h"
#import "PatientDocResumeController.h"
#import "EmployDetailParam.h"
#import "PatientAcceptTool.h"
#import "DoctorResumeTool.h"
#import "LDNotification.h"
@interface PatientDocResumeController () <DoctorResumeViewDelegate>
@property (nonatomic,strong) DoctorResume  *resume;
@property (nonatomic,weak) DoctorResumeView *resumeView;
@end

@implementation PatientDocResumeController
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
#pragma mark - resumeview delegate
- (void)DoctorResumeView:(DoctorResumeView *)doctorView inviteBtnClicked:(UIButton *)inviteBtn
{
    EmployDetailParam *param = [EmployDetailParam paramWithId:self.resume.id];
    [PatientAcceptTool acceptDocResumeWithParam:param success:^(BaseResult *result) {
        if ([result.status isEqualToString:@"S"]) {
            [[NSNotificationCenter defaultCenter] postNotificationName:PATIENTACCEPTDOCSUCCESSNOTIFICATION object:self];
            [self.navigationController popViewControllerAnimated:YES];
        }
    } failure:^(NSError *error) {
        [MBProgressHUD showError:@"录取失败"];
    }];
}
- (void)doctorResumeView:(DoctorResumeView *)doctorView chatBtnClicked:(UIButton *)chatBtn
{
    ChatViewController *chatVc = [[ChatViewController alloc] init];
    chatVc.clientToChat = self.resume.clientNumber;
    [self.navigationController pushViewController:chatVc animated:YES];
}

@end
