//
//  HospitalAdminController.m
//  邻医家
//
//  Created by Daniel on 15/6/1.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "Common.h"
#import "HospitalAdminController.h"
#import "DepartmentListController.h"
#import "EnrolledRecruitController.h"
#import "IWCommon.h"
#import "RecruitChildController.h"
#import "UILabel+LD.h"
#import "MessageTypeController.h"
#import "LDPlatformButton.h"
@interface HospitalAdminController ()
/**
 *    招聘信息发布
 */
@property (nonatomic,weak) LDPlatformButton *recruitBtn;
/**
 *  应聘管理
 */
@property (nonatomic,weak) LDPlatformButton *adminBtn;
/**
 *  指定科室负责人
 */
@property (nonatomic,weak) LDPlatformButton *capitalBtn;
/**
 *   发布医院信息
 */
@property (nonatomic,weak) LDPlatformButton *postMessageBtn;
@end

@implementation HospitalAdminController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self addCustomViews];
    [self layoutCustomViews];
    
}
- (void)setup
{
    self.navigationItem.title  = @"医院管理者平台";
    self.view.backgroundColor = IWColor(226, 226, 226);
}
- (void)addCustomViews
{
    LDPlatformButton *recruitBtn = [LDPlatformButton platformBtnWithImage:@"adminpost" title:@"招聘信息发布" target:self action:@selector(recruitBtnClicked)];
    recruitBtn.backgroundColor = IWColor(88, 202, 203);
    [self.view addSubview:recruitBtn];
    self.recruitBtn = recruitBtn;
    
    LDPlatformButton *adminBtn = [LDPlatformButton platformBtnWithImage:@"adminappliant" title:@"应聘管理" target:self action:@selector(adminBtnClicked)];
    adminBtn.backgroundColor = IWColor(175, 203, 115);
    [self.view addSubview:adminBtn];
    self.adminBtn = adminBtn;
    
    LDPlatformButton *capitalBtn = [LDPlatformButton platformBtnWithImage:@"admindispatch" title:@"科室权限分配" target:self action:@selector(capitalBtnClicked)];
    capitalBtn.backgroundColor = IWColor(245, 96, 115);
    [self.view addSubview:capitalBtn];
    self.capitalBtn = capitalBtn;
    
    LDPlatformButton *postMessageBtn = [LDPlatformButton platformBtnWithImage:@"adminposthos" title:@"发布医院信息" target:self action:@selector(postMessageBtnClicked)];
    postMessageBtn.backgroundColor = IWColor(248, 160, 54);
    [self.view addSubview:postMessageBtn];
    self.postMessageBtn = postMessageBtn;
}
- (void)layoutCustomViews
{
    CGFloat padding = 10;
    CGFloat recruitBtnX = 10;
    CGFloat recruitBtnY = 74;
    CGFloat recruitBtnW = (SCREENWIDTH - 3 * padding)/2;
    CGFloat recruitBtnH = 130;
    self.recruitBtn.frame = CGRectMake(recruitBtnX, recruitBtnY, recruitBtnW, recruitBtnH);
    
    CGFloat adminX = CGRectGetMaxX(self.recruitBtn.frame) + padding;
    CGFloat adminY = recruitBtnY;
    CGFloat adminW = recruitBtnW;
    CGFloat adminH = recruitBtnH;
    self.adminBtn.frame = CGRectMake(adminX, adminY, adminW, adminH);
    
    CGFloat capitalBtnX = recruitBtnX;
    CGFloat capitalBtnY = CGRectGetMaxY(self.recruitBtn.frame) + padding;
    CGFloat capitalBtnW = recruitBtnW;
    CGFloat capitalBtnH = recruitBtnH;
    self.capitalBtn.frame = CGRectMake(capitalBtnX, capitalBtnY, capitalBtnW, capitalBtnH);
    
    CGFloat postBtnX = CGRectGetMaxX(self.capitalBtn.frame) + padding;
    CGFloat postBtnY = capitalBtnY;
    CGFloat postBtnW = capitalBtnW;
    CGFloat postBtnH = capitalBtnH;
    self.postMessageBtn.frame = CGRectMake(postBtnX, postBtnY, postBtnW, postBtnH);
}

- (void)recruitBtnClicked
{
    RecruitChildController *recruit = [[RecruitChildController alloc] init];
    [self.navigationController pushViewController:recruit animated:YES];
}
- (void)capitalBtnClicked
{
    DepartmentListController *depVC = [[DepartmentListController alloc] init];
    [self.navigationController pushViewController:depVC animated:YES];
}
- (void)postMessageBtnClicked
{
    MessageTypeController *messageVC = [[MessageTypeController alloc] init];
    [self.navigationController pushViewController:messageVC animated:YES];
}
- (void)adminBtnClicked
{
    EnrolledRecruitController *enVC = [[EnrolledRecruitController alloc] init];
    [self.navigationController pushViewController:enVC animated:YES];
}


@end












