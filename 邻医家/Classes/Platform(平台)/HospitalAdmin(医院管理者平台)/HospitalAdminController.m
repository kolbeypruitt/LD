//
//  HospitalAdminController.m
//  邻医家
//
//  Created by Daniel on 15/6/1.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "Common.h"
#import "HospitalAdminController.h"
#import "AssignDepartmentController.h"
#import "IWCommon.h"
#import "PlatformRecruitController.h"
#import "UILabel+LD.h"
#import "MessageTypeController.h"
@interface HospitalAdminController ()
/**
 *    招聘
 */
@property (nonatomic,weak) UIButton *recruitBtn;
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
    [self setupBtn:recruitBtn WithTitle:@"招聘" target:self action:@selector(recruitBtnClicked)];
    [self.view addSubview:recruitBtn];
    self.recruitBtn = recruitBtn;
    
    UIButton *capitalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self setupBtn:capitalBtn WithTitle:@"指定科室负责人" target:self action:@selector(capitalBtnClicked)];
    [self.view addSubview:capitalBtn];
    self.capitalBtn = capitalBtn;
    
    UIButton *postMessageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self setupBtn:postMessageBtn WithTitle:@"发布医院信息" target:self action:@selector(postMessageBtnClicked)];
    [self.view addSubview:postMessageBtn];
    self.postMessageBtn = postMessageBtn;
}
- (void)layoutCustomViews
{
    CGFloat recruitBtnX = 0;
    CGFloat recruitBtnY = 64;
    CGFloat recruitBtnW = SCREENWIDTH;
    CGFloat recruitBtnH = 84;
    self.recruitBtn.frame = CGRectMake(recruitBtnX, recruitBtnY, recruitBtnW, recruitBtnH);
    
    CGFloat capitalBtnX = recruitBtnX;
    CGFloat capitalBtnY = CGRectGetMaxY(self.recruitBtn.frame);
    CGFloat capitalBtnW = recruitBtnW/2;
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
    UIColor *randomColor = IWColor(arc4random()%255, arc4random()%255, arc4random()%255);
    button.backgroundColor = randomColor;
}
- (void)recruitBtnClicked
{
    PlatformRecruitController *recruit = [[PlatformRecruitController alloc] init];
    [self.navigationController pushViewController:recruit animated:YES];
}
- (void)capitalBtnClicked
{
    AssignDepartmentController *assignVC = [[AssignDepartmentController alloc] init];
    [self.navigationController pushViewController:assignVC animated:YES];
}
- (void)postMessageBtnClicked
{
    MessageTypeController *messageVC = [[MessageTypeController alloc] init];
    [self.navigationController pushViewController:messageVC animated:YES];
}



@end













