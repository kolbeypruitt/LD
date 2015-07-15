//
//  AssignDepartmentController.m
//  邻医家
//
//  Created by Daniel on 15/6/12.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDInputMessage.h"
#import "CommitMessage.h"
#import "BaseResult.h"
#import "ActionSheetCustomPicker+LD.h"
#import "SetChargeTool.h"
#import "FirstDepartmentDelegate.h"
#import "AssignDepartmentController.h"
#import "MBProgressHUD+MJ.h"
#import "HospitalEnterTextField.h"
#import "LDEnterData.h"
#import "Common.h"
#import "LDNotification.h"
#import "SetCharageParam.h"
@interface AssignDepartmentController () <UITextFieldDelegate>

@end

@implementation AssignDepartmentController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.title = @"科室权限分配";
    self.view.backgroundColor = IWColor(226, 226, 226);
    self.navigationItem.rightBarButtonItem = nil;
    [self addMessages];
}

- (void)addMessages
{
    
    LDInputMessage *message0 = [LDInputMessage messageWithFirstTitle:@"姓名" placeHolder:@"请输入姓名" optionDelegate:nil];
    LDInputMessage *message1 = [LDInputMessage messageWithFirstTitle:@"手机号" placeHolder:@"请输入手机号" optionDelegate:nil];
    LDInputMessage *message2 = [LDInputMessage messageWithFirstTitle:@"座机号" placeHolder:@"请输入座机号" optionDelegate:nil];
    LDInputMessage *message3 = [LDInputMessage messageWithFirstTitle:@"邮箱" placeHolder:@"请输入邮箱" optionDelegate:nil];
    LDInputMessage *message4 = [LDInputMessage messageWithFirstTitle:@"科室" placeHolder:@"请选择科室" optionDelegate:[[FirstDepartmentDelegate alloc] init]];
    LDInputMessage *message5 = [LDInputMessage messageWithFirstTitle:@"科室简介" placeHolder:@"请输入科室简介" optionDelegate:nil];
    self.inputMessages = @[message0,message1,message2,message3,message4,message5];
}
- (void)commitBtnClicked
{
    if ([self messageComplete]) {
            [SetChargeTool setChargeWithParam:[self fillParam] success:^(BaseResult *result) {
            if ([result.status isEqualToString:@"S"]) {
                [DefaultCenter postNotificationName:MANAGERLISTREFRESHNOTIFICATION object:self];
                [self.navigationController popViewControllerAnimated:YES];
            }else
            {
                [MBProgressHUD showError:@"发布失败!"];
            }
        } failure:^(NSError *error) {
            
        }];
    }

}
- (SetCharageParam *)fillParam
{
    SetCharageParam *param = [[SetCharageParam alloc] init];
    param.name = [self.commitMessages[0] stringMsg];
    param.telnum = [self.commitMessages[1] stringMsg];
    param.phone = [self.commitMessages[2] stringMsg];
    param.mailbox = [self.commitMessages[3] stringMsg];
    param.department = [self.commitMessages[4] intMsg];
    param.introduction = [self.commitMessages[5] stringMsg];
    return param;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


@end










