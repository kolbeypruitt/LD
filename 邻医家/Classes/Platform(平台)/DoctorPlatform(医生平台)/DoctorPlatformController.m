//
//  DoctorPlatformController.m
//  邻医家
//
//  Created by Daniel on 15/6/7.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "DoctorConsultListParam.h"
#import "DoctorPlatformController.h"
#import "Common.h"
#import "FreeMessageController.h"
#import "PostedSurgeryController.h"
#import "PostedStubbornController.h"
#import "PostedTemporaryController.h"
#import "PostedFreeFController.h"
@interface DoctorPlatformController () <UIActionSheetDelegate>
@property (nonatomic,weak) UIButton *consultBtn;
@property (nonatomic,weak) UIButton *inviteBtn;
@end

@implementation DoctorPlatformController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.title = @"医生平台";
    [self addSubviews];
    [self layoutViews];
}
- (void)addSubviews
{
    self.consultBtn = [self createBtnWithTitle:@"会诊信息" target:self action:@selector(buttonPressed:)];
    self.inviteBtn = [self createBtnWithTitle:@"请医信息" target:self action:@selector(buttonPressed:)];
}
- (void)buttonPressed:(UIButton *)senderBtn
{
    if ([senderBtn isEqual:self.consultBtn]) {
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                                 delegate:self
                                                        cancelButtonTitle:@"取消"
                                                   destructiveButtonTitle:nil
                                                        otherButtonTitles:@"开刀",@"疑难杂症会诊",@"临时会诊",@"自由转诊", nil];
        [actionSheet showInView:self.view];
    }else{
        FreeMessageController *free = [[FreeMessageController alloc] init];
        [self.navigationController pushViewController:free animated:YES];
    }
}
#pragma mark - UIActionSheet Delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    DoctorConsultListParam *param = [DoctorConsultListParam paramWithType:(int)(buttonIndex + 1)];
    switch (buttonIndex) {
        case 0:
        {
            PostedSurgeryController *surgery = [[PostedSurgeryController alloc] init];
            surgery.param = param;
            [self.navigationController pushViewController:surgery animated:YES];
            break;
        }
        case 1:
        {
            PostedStubbornController *stubborn = [[PostedStubbornController alloc] init];
            stubborn.param = param;
            [self.navigationController pushViewController:stubborn animated:YES];
            break;
        }
        case 2:
        {
            PostedTemporaryController *temporary = [[PostedTemporaryController alloc] init];
            temporary.param  = param;
            [self.navigationController pushViewController:temporary animated:YES];
            break;
        }
        case 3:
        {
            PostedFreeFController *freeF = [[PostedFreeFController alloc] init];
            freeF.param = param;
            [self.navigationController pushViewController:freeF animated:YES];
            break;
        }
        default:
            break;
    }
}
- (void)layoutViews
{
    CGFloat btnX = 10;
    CGFloat btnY = 84;
    CGFloat btnW = (SCREENWIDTH - 30) / 2 ;
    CGFloat btnH = 50;
    self.consultBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    self.consultBtn.backgroundColor = IWColor(56, 56, 56);
    
    self.inviteBtn.frame = CGRectMake(btnW+20, btnY, btnW, btnH);
    self.inviteBtn.backgroundColor = IWColor(80, 80, 90);
}
- (UIButton *)createBtnWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.layer.cornerRadius = 8;
    [self.view addSubview:button];
    return button;
}
@end
