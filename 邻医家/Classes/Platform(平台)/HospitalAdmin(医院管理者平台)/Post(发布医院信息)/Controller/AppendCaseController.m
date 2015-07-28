//
//  AppendCaseController.m
//  邻医家
//
//  Created by Daniel on 15/7/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "CommitMessage.h"
#import "LDInputMessage.h"
#import "LDInputView.h"
#import "NSString+Check.h"
#import "BaseResult.h"
#import "LDNotification.h"
#import "AppendCaseController.h"
#import "MBProgressHUD+MJ.h"
#import "ReleaseCaseTool.h"
#import "ReleaseCaseParam.h"
#import "SexDelegate.h"
#import "DepartmentDelegate.h"
#import "Common.h"
@interface AppendCaseController ()
@end


@implementation AppendCaseController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.title = @"发布病例";
    [self addMessages];
}
- (void)addMessages
{
    LDInputMessage *message0 = [LDInputMessage messageWithFirstTitle:@"性别" placeHolder:@"请选择性别" optionDelegate:[[SexDelegate alloc] init]];
    LDInputMessage *message1 = [LDInputMessage messageWithFirstTitle:@"真实姓名" placeHolder:@"请输入真实姓名" optionDelegate:nil];
    LDInputMessage *message2 = [LDInputMessage messageWithFirstTitle:@"年龄" placeHolder:@"请输入年龄" optionDelegate:nil];
    LDInputMessage *message3 = [LDInputMessage messageWithFirstTitle:@"科室" placeHolder:@"请选择科室" optionDelegate:[[DepartmentDelegate alloc] init]];
    LDInputMessage *message4 = [LDInputMessage messageWithFirstTitle:@"病例介绍" placeHolder:@"请输入病例介绍" optionDelegate:nil];
    LDInputMessage *message5 = [LDInputMessage messageWithFirstTitle:@"主诉" placeHolder:@"请输入主诉" optionDelegate:nil];
    LDInputMessage *message6 = [LDInputMessage messageWithFirstTitle:@"现病史" placeHolder:@"请输入现病史" optionDelegate:nil];
    LDInputMessage *message7 = [LDInputMessage messageWithFirstTitle:@"既往病史" placeHolder:@"请输入既往病史" optionDelegate:nil];
    LDInputMessage *message8 = [LDInputMessage messageWithFirstTitle:@"查体" placeHolder:@"请输入查体" optionDelegate:nil];
    LDInputMessage *message9 = [LDInputMessage messageWithFirstTitle:@"辅助查体" placeHolder:@"请输入辅助查体" optionDelegate:nil];
    LDInputMessage *message10 = [LDInputMessage messageWithFirstTitle:@"诊断" placeHolder:@"请输入诊断" optionDelegate:nil];
    LDInputMessage *message11 = [LDInputMessage messageWithFirstTitle:@"治疗过程" placeHolder:@"请输入治疗过程" optionDelegate:nil];
    self.inputMessages = @[message0,message1,message2,message3,message4,message5,message6,message7,message8,message9,message10,message11];
    self.showUpView = NO;
}
- (void)commitBtnClicked
{
    if (![self messageComplete]) {
        return;
    }
    [self commit];
}
- (BOOL)messageComplete
{
    LDInputView *inputView = self.inputViews[2];
    UITextField *textfield = inputView.inputField;
    if (![textfield.text dg_isNumber]) {
        [MBProgressHUD showError:@"请输入正确年龄"];
        return NO;
    }
    return [super messageComplete];
}
- (void)commit
{
    
        ReleaseCaseParam *param =  [self fillParam];
        [ReleaseCaseTool releaseCaseWithParam:param success:^(BaseResult *result) {
            if ([result.status isEqualToString:@"S"]) {
                [DefaultCenter postNotificationName:RELEASECASESUCCESSNOTIFICATION object:self];
                [self.navigationController popViewControllerAnimated:YES];
            }else
            {
                [MBProgressHUD showError:@"发布失败!"];
            }
        } failure:^(NSError *error) {
                [MBProgressHUD showError:@"发布失败!"];
        }];
}
- (ReleaseCaseParam *)fillParam
{
    ReleaseCaseParam *param = [[ReleaseCaseParam alloc] init];
    param.gender = [self.commitMessages[0] intMsg];
    param.name = [self.commitMessages[1] stringMsg];
    param.age = [[self.commitMessages[2] stringMsg] intValue];
    param.department = [self.commitMessages[3] intMsg];
    param.detail = [self.commitMessages[4] stringMsg];
    param.chiefComplaint = [self.commitMessages[5] stringMsg];
    param.illNow = [self.commitMessages[6] stringMsg];
    param.illBefore = [self.commitMessages[7] stringMsg];
    param.bodyCheck = [self.commitMessages[8] stringMsg];
    param.supportCheck = [self.commitMessages[9] stringMsg];
    param.diagnose = [self.commitMessages[10] stringMsg];
    param.treatmentProcess = [self.commitMessages[11] stringMsg];
    return param;
}
@end


















