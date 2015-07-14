//
//  DoctorPlatformController.m
//  邻医家
//
//  Created by Daniel on 15/7/10.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "UIImage+MJ.h"
#import "MyAppliantController.h"
#import "MyConsultController.h"
#import "MyInviteController.h"
#import "DoctorConsultListParam.h"
#import "DoctorPlatformController.h"
#import "Common.h"
#import "FreeMessageController.h"
#import "PostedSurgeryController.h"
#import "PostedStubbornController.h"
#import "PostedTemporaryController.h"
#import "PostedFreeFController.h"
#import "LoginDocDetailController.h"
#import "Doctor.h"
#import "LoginDocDetailTool.h"
#import "LoginDocDetailResult.h"
#import "LDBaseParam.h"
#import "Account.h"
#import "AccountTool.h"
#import "LDPlatformButton.h"
@interface DoctorPlatformController ()<UIActionSheetDelegate>
@property (weak, nonatomic)  LDPlatformButton *personalBtn;
@property (weak, nonatomic)  LDPlatformButton *adminBtn;
@property (weak, nonatomic)  LDPlatformButton *freeBtn;
@property (weak, nonatomic)  LDPlatformButton *inviteBtn;

@property (nonatomic,weak) UIActionSheet *applySheet;
@property (nonatomic,weak) UIActionSheet *freeSheet;
@end

@implementation DoctorPlatformController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup
{
    self.navigationItem.title = @"医生平台";
    self.view.backgroundColor = BGCOLOR;
    [self addCustomViews];
    [self layoutCustomViews];
   
}
- (void)addCustomViews
{
    LDPlatformButton *personalBtn = [LDPlatformButton platformBtnWithImage:@"docpersonal" title:@"个人信息维护" target:self action:@selector(personal)];
    [personalBtn setBackgroundColor:IWColor(88, 202, 203)];
    self.personalBtn = personalBtn;
    
    LDPlatformButton *adminBtn  = [LDPlatformButton platformBtnWithImage:@"docappliant" title:@"应聘管理" target:self action:@selector(applyAdmin)];
    [adminBtn setBackgroundColor:IWColor(175, 203, 115)];
    self.adminBtn = adminBtn;
    
    LDPlatformButton *freeBtn = [LDPlatformButton platformBtnWithImage:@"docaccept" title:@"自由接诊" target:self action:@selector(freeConsult)];
    
    [freeBtn setBackgroundColor:IWColor(245, 96, 115)];
    self.freeBtn = freeBtn;
    
    LDPlatformButton *inviteBtn = [LDPlatformButton platformBtnWithImage:@"docinvite" title:@"请医信息" target:self action:@selector(inviteMessage)];
    [inviteBtn setBackgroundColor:IWColor(245, 177, 68)];
    self.inviteBtn = inviteBtn;
    
    [self.view addSubview:self.personalBtn];
    [self.view addSubview:self.adminBtn];
    [self.view addSubview:self.freeBtn];
    [self.view addSubview:self.inviteBtn];
}
- (void)layoutCustomViews
{
    CGFloat padding = 10;
    CGFloat btnW = (SCREENWIDTH - 3 * padding)/2;
    CGFloat btnH = 130;
    CGFloat btnX = padding;
    CGFloat btnY = padding + 64;
    self.personalBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    
    self.adminBtn.frame = CGRectMake(CGRectGetMaxX(self.personalBtn.frame)+padding, btnY, btnW, btnH);
    
    self.freeBtn.frame = CGRectMake(btnX, CGRectGetMaxY(self.personalBtn.frame)+padding, btnW, btnH);
    
    self.inviteBtn.frame = CGRectMake(self.adminBtn.frame.origin.x, self.freeBtn.frame.origin.y, btnW, btnH);
    
    

}
#pragma mark - UIActionSheet Delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([actionSheet isEqual:self.freeSheet]) {
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
    }else
    {
        switch (buttonIndex) {
            case 0:
            {
                MyAppliantController *appliant = [[MyAppliantController alloc] init];
                [self.navigationController pushViewController:appliant animated:YES];
                break;
            }
            case 1:
            {
                MyConsultController *consult = [[MyConsultController alloc] init];
                [self.navigationController pushViewController:consult animated:YES];
                break;
            }
            case 2:
            {
                MyInviteController *invite = [[MyInviteController alloc] init];
                [self.navigationController pushViewController:invite animated:YES];
                break;
            }
            
            default:
                break;
        }
    }
    
}
#pragma mark - 个人信息维护
- (void)personal {
    Account *me = [AccountTool account];
    Doctor *myself = [[Doctor alloc] init];
    myself.id = me.id;
    LoginDocDetailController *loginVC = [[LoginDocDetailController alloc] init];
    loginVC.doctor = myself;
    [self.navigationController pushViewController:loginVC animated:YES];
}
#pragma mark - 应聘管理
- (void)applyAdmin{
    UIActionSheet *applySheet = [[UIActionSheet alloc] initWithTitle:nil
                                                            delegate:self
                                                   cancelButtonTitle:@"取消"
                                              destructiveButtonTitle:nil
                                                   otherButtonTitles:@"我的招聘",@"我的会诊",@"我的请医", nil];
    self.applySheet = applySheet;
    [applySheet showInView:self.view];
}
#pragma mark - 自由接诊
- (void)freeConsult
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"开刀",@"疑难杂症会诊",@"临时会诊",@"自由转诊", nil];
    self.freeSheet = actionSheet;
    [actionSheet showInView:self.view];
}
#pragma mark - 请医信息列表
- (void)inviteMessage
{
    FreeMessageController *free = [[FreeMessageController alloc] init];
    [self.navigationController pushViewController:free animated:YES];
}
@end
