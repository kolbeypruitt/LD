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
#import "IWCommon.h"
#import "RecruitChildController.h"
#import "UILabel+LD.h"
#import "MessageTypeController.h"
@interface HospitalAdminController ()
/**
 *    招聘信息发布
 */
@property (nonatomic,weak) UIButton *recruitBtn;
/**
 *  应聘管理
 */
@property (nonatomic,weak) UIButton *adminBtn;
/**
 *  指定科室负责人
 */
@property (nonatomic,weak) UIButton *capitalBtn;
/**
 *   发布医院信息
 */
@property (nonatomic,weak) UIButton *postMessageBtn;
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
    UIButton *recruitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    recruitBtn.backgroundColor = IWColor(156, 56, 56);
    [self setupBtn:recruitBtn WithTitle:@"招聘信息发布" target:self action:@selector(recruitBtnClicked)];
    [self.view addSubview:recruitBtn];
    self.recruitBtn = recruitBtn;
    UIButton *adminBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    adminBtn.backgroundColor = IWColor(10, 100, 100);
    [self setupBtn:adminBtn WithTitle:@"应聘管理" target:self action:nil];
    [self.view addSubview:adminBtn];
    self.adminBtn = adminBtn;
    
    UIButton *capitalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    capitalBtn.backgroundColor = IWColor(60, 160, 60);
    [self setupBtn:capitalBtn WithTitle:@"科室权限分配" target:self action:@selector(capitalBtnClicked)];
    [self.view addSubview:capitalBtn];
    self.capitalBtn = capitalBtn;
    
    UIButton *postMessageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    postMessageBtn.backgroundColor = IWColor(44, 55, 155);
    [self setupBtn:postMessageBtn WithTitle:@"发布医院信息" target:self action:@selector(postMessageBtnClicked)];
    [self.view addSubview:postMessageBtn];
    self.postMessageBtn = postMessageBtn;
}
- (void)layoutCustomViews
{
    CGFloat recruitBtnX = 0;
    CGFloat recruitBtnY = 64;
    CGFloat recruitBtnW = SCREENWIDTH/2;
    CGFloat recruitBtnH = 84;
    self.recruitBtn.frame = CGRectMake(recruitBtnX, recruitBtnY, recruitBtnW, recruitBtnH);
    
    CGFloat adminX = CGRectGetMaxX(self.recruitBtn.frame);
    CGFloat adminY = recruitBtnY;
    CGFloat adminW = recruitBtnW;
    CGFloat adminH = recruitBtnH;
    self.adminBtn.frame = CGRectMake(adminX, adminY, adminW, adminH);
    
    CGFloat capitalBtnX = recruitBtnX;
    CGFloat capitalBtnY = CGRectGetMaxY(self.recruitBtn.frame);
    CGFloat capitalBtnW = recruitBtnW;
    CGFloat capitalBtnH = recruitBtnH;
    self.capitalBtn.frame = CGRectMake(capitalBtnX, capitalBtnY, capitalBtnW, capitalBtnH);
    
    CGFloat postBtnX = CGRectGetMaxX(self.capitalBtn.frame);
    CGFloat postBtnY = capitalBtnY;
    CGFloat postBtnW = capitalBtnW;
    CGFloat postBtnH = capitalBtnH;
    self.postMessageBtn.frame = CGRectMake(postBtnX, postBtnY, postBtnW, postBtnH);
}
- (void)setupBtn:(UIButton *)button WithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    button.titleLabel.backgroundColor = [UIColor clearColor];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
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



@end













