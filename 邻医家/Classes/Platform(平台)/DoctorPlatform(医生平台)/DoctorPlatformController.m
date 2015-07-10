//
//  DoctorPlatformController.m
//  邻医家
//
//  Created by Daniel on 15/7/10.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
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
@interface DoctorPlatformController ()<UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIButton *consultBtn;
@property (weak, nonatomic) IBOutlet UIButton *inviteBtn;
@property (nonatomic,weak) UIActionSheet *applySheet;
@property (nonatomic,weak) UIActionSheet *freeSheet;
@end

@implementation DoctorPlatformController
- (IBAction)personal:(id)sender {
    Account *me = [AccountTool account];
    Doctor *myself = [[Doctor alloc] init];
    myself.id = me.id;
    LoginDocDetailController *loginVC = [[LoginDocDetailController alloc] init];
    loginVC.doctor = myself;
    [self.navigationController pushViewController:loginVC animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (IBAction)buttonPressed:(UIButton *)sender {
    if ([sender isEqual:self.consultBtn]) {
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                                 delegate:self
                                                        cancelButtonTitle:@"取消"
                                                   destructiveButtonTitle:nil
                                                        otherButtonTitles:@"开刀",@"疑难杂症会诊",@"临时会诊",@"自由转诊", nil];
        self.freeSheet = actionSheet;
        [actionSheet showInView:self.view];
    }else if([sender isEqual:self.inviteBtn]){
        FreeMessageController *free = [[FreeMessageController alloc] init];
        [self.navigationController pushViewController:free animated:YES];
    }
}
- (IBAction)applyAdmin:(id)sender {
    UIActionSheet *applySheet = [[UIActionSheet alloc] initWithTitle:nil
                                                            delegate:self
                                                   cancelButtonTitle:@"取消"
                                              destructiveButtonTitle:nil
                                                   otherButtonTitles:@"我的招聘",@"我的会诊",@"我的请医", nil];
    self.applySheet = applySheet;
    [applySheet showInView:self.view];
}

- (void)setup
{
    self.navigationItem.title = @"医生平台";
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
@end
