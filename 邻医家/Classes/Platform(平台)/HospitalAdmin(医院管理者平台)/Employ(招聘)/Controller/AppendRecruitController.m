//
//  AppendRecruitController.m
//  邻医家
//
//  Created by Daniel on 15/7/7.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "NSString+Check.h"
#import "LDNotification.h"
#import "Common.h"
#import "MBProgressHUD+MJ.h"
#import "LDInputView.h"
#import "LDInputMessage.h"
#import "CommitMessage.h"
#import "AppendRecruitController.h"
#import "UIBarButtonItem+ENTER.h"
#import "AppendRecruitTool.h"
#import "BaseResult.h"
#import "AppendRecruitParam.h"

#import "JobTypeDelegate.h"
#import "DepartmentDelegate.h"
#import "ZonePickerDelegate.h"
#import "DegreeDelegate.h"
#import "EnglishDelegate.h"
@interface AppendRecruitController ()
@end

@implementation AppendRecruitController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(postRecruit) title:@"发布"];
    self.title = @"创建招聘";
    [self addMessages];
}
- (void)addMessages
{
    LDInputMessage *message0 = [LDInputMessage messageWithFirstTitle:@"标题" placeHolder:@"请输入招聘标题" optionDelegate:nil];
    LDInputMessage *message1 = [LDInputMessage messageWithFirstTitle:@"职位性质" placeHolder:@"请选择职位性质" optionDelegate:[[JobTypeDelegate alloc] init]];
    LDInputMessage *message2 = [LDInputMessage messageWithFirstTitle:@"科室" placeHolder:@"请选择科室" optionDelegate:[[DepartmentDelegate alloc] init]];
    LDInputMessage *message3 = [LDInputMessage messageWithFirstTitle:@"岗位" placeHolder:@"请输入岗位" optionDelegate:nil];
    LDInputMessage *message4 = [LDInputMessage messageWithFirstTitle:@"地点" placeHolder:@"请选择地点" optionDelegate:[[ZonePickerDelegate alloc] init]];
    LDInputMessage *message5 = [LDInputMessage messageWithFirstTitle:@"详细地址" placeHolder:@"请输入详细地址" optionDelegate:nil];
    LDInputMessage *message6 = [LDInputMessage messageWithFirstTitle:@"人数" placeHolder:@"请输入人数" optionDelegate:nil];
    LDInputMessage *message7 = [LDInputMessage messageWithFirstTitle:@"学历" placeHolder:@"请选择学历" optionDelegate:[[DegreeDelegate alloc] init]];
    LDInputMessage *message8 = [LDInputMessage messageWithFirstTitle:@"外语" placeHolder:@"请选择外语" optionDelegate:[[EnglishDelegate alloc] init]];
    LDInputMessage *message9 = [LDInputMessage messageWithFirstTitle:@"年龄" placeHolder:@"请输入年龄" optionDelegate:nil];
    LDInputMessage *message10 = [LDInputMessage messageWithFirstTitle:@"专业" placeHolder:@"请输入专业" optionDelegate:nil];
    LDInputMessage *message11 = [LDInputMessage messageWithFirstTitle:@"招聘条件" placeHolder:@"请输入招聘条件" optionDelegate:nil];
    self.inputMessages = @[message0,message1,message2,message3,message4,message5,message6,message7,message8,message9,message10,message11];
    self.showUpView = NO;
}

#pragma mark - 发布招聘
- (void)commitBtnClicked
{
    [self postRecruit];
}
- (void)postRecruit
{
    if (![self messageComplete]) {
        return;
    }
    AppendRecruitParam *param = [self fillParam];
    __weak typeof(self) weakSelf = self;
    [AppendRecruitTool appendRecruitWithParam:param success:^(BaseResult *result) {
        if ([result.status isEqualToString:@"S"]) {
            [DefaultCenter postNotificationName:APPENDRECRUITSUCCESSNOTIFICATION object:weakSelf];
            [self.navigationController popViewControllerAnimated:YES];
        }else
        {
            [MBProgressHUD showError:result.errorMsg];
        }
        
    } failure:^(NSError *error) {
            [MBProgressHUD showError:@"发布失败!"];
    }];
}
- (AppendRecruitParam *)fillParam
{
    AppendRecruitParam *param = [[AppendRecruitParam alloc] init];
    param.name = [self.commitMessages[0] stringMsg];
    param.employtype = [self.commitMessages[1] intMsg];
    param.department = [self.commitMessages[2] intMsg];
    param.jobname = [self.commitMessages[3] stringMsg];
    param.location = [self.commitMessages[4] intMsg];
    param.address = [self.commitMessages[5] stringMsg];
    param.employNum = [[self.commitMessages[6] stringMsg] intValue];
    param.education = [self.commitMessages[7] stringMsg];
    param.language = [self.commitMessages[8] stringMsg];
    param.age = [self.commitMessages[9] stringMsg];
    param.profession = [self.commitMessages[10] stringMsg];
    param.introduction = [self.commitMessages[11] stringMsg];
    return param;
}
- (BOOL)messageComplete
{
    LDInputView *inputView = self.inputViews[6];
    UITextField *textfield = inputView.inputField;
    if (![textfield.text dg_isNumber]) {
        [MBProgressHUD showError:@"请输入正确人数"];
        return NO;
    }
    inputView = self.inputViews[9];
    textfield = inputView.inputField;
    if (![textfield.text dg_isNumber]) {
        [MBProgressHUD showError:@"请输入正确年龄"];
        return NO;
    }
    return [super messageComplete];
}
@end
