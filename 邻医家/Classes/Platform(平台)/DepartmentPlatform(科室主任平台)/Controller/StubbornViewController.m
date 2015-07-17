//
//  StubbornViewController.m
//  邻医家
//
//  Created by Daniel on 15/6/6.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDNotification.h"
#import "BaseResult.h"
#import "StubbornViewController.h"
#import "Common.h"
#import "UIBarButtonItem+ENTER.h"
#import "HospitalEnterTextField.h"
#import "MBProgressHUD+MJ.h"
#import "IshospitalDelegate.h"
#import "PostConsultParam.h"
#import "NiyaoDelegate.h"
#import "LDEnterData.h"
#import "SingleDepartmentDelegate.h"
#import "ZonePickerDelegate.h"
#import "ActionSheetCustomPicker+LD.h"
#import "TimeDeletage.h"
#import "PostConsultTool.h"
#import "UIBarButtonItem+ENTER.h"
#import "LDInputMessage.h"
#import "CommitMessage.h"
@interface StubbornViewController () <UITextFieldDelegate>
@end

@implementation StubbornViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.title = @"疑难杂症会诊";
    self.view.backgroundColor = IWColor(226, 226, 226);
    [self addMessages];
}
- (void)addMessages
{
    LDInputMessage *message0 = [LDInputMessage messageWithFirstTitle:@"科室" placeHolder:@"选择科室" optionDelegate:[[SingleDepartmentDelegate alloc] init]];
    LDInputMessage *message1 = [LDInputMessage messageWithFirstTitle:@"待查疾病名称" placeHolder:@"请输入疾病名称" optionDelegate:nil ];
    LDInputMessage *message2 = [LDInputMessage messageWithFirstTitle:@"患者病例摘要" placeHolder:@"请输入病例摘要" optionDelegate:nil ];
    LDInputMessage *message3 = [LDInputMessage messageWithFirstTitle:@"会诊约定时间" placeHolder:@"请选择时间" optionDelegate:[[TimeDeletage alloc] init]];
    LDInputMessage *message4 = [LDInputMessage messageWithFirstTitle:@"会诊约定地址" placeHolder:@"请选择地址" optionDelegate:[[ZonePickerDelegate alloc] init]];
    LDInputMessage *message5 = [LDInputMessage messageWithFirstTitle:@"详细地址" placeHolder:@"请输入详细地址" optionDelegate:nil ];
    LDInputMessage *message6 = [LDInputMessage messageWithFirstTitle:@"医院名称" placeHolder:@"请输入医院名称" optionDelegate:nil ];
    LDInputMessage *message7 = [LDInputMessage messageWithFirstTitle:@"拟邀医生技术职位" placeHolder:@"请选择医生职位" optionDelegate:[[NiyaoDelegate alloc] init] ];
    LDInputMessage *message8 = [LDInputMessage messageWithFirstTitle:@"是否住院" placeHolder:@"请选择" optionDelegate:[[IshospitalDelegate alloc] init]];
    self.inputMessages = @[message0,message1,message2,message3,message4,message5,message6,message7,message8];
}
- (void)commitBtnClicked
{
    if ([self messageComplete]) {
        [self post];
    }
}

- (void)post
{
    PostConsultParam *param = [[PostConsultParam alloc] init];
    param.consultationType = 2;
    param.department = [self.commitMessages[0] intMsg];
    param.illness = [self.commitMessages[1] stringMsg];
    param.caseAbstract = [self.commitMessages[2] stringMsg];
    param.time = [self.commitMessages[3] stringMsg];
    param.location = [self.commitMessages[4] intMsg];
    param.address = [self.commitMessages[5] stringMsg];
    param.appointHospital = [self.commitMessages[6] stringMsg];
    param.doctorJob = [self.commitMessages[7] stringMsg];
    param.isHospital = [self.commitMessages[8] intMsg];
    
    [PostConsultTool postConsulWithParam:param success:^(BaseResult *result) {
        if ([result.status isEqualToString:SUCCESSSTATUS]) {
            [DefaultCenter postNotificationName:DEPARTMENTMSGREFRESHNOTIFICATION object:self];
            [self.navigationController popViewControllerAnimated:YES];
        }else
        {
            [MBProgressHUD showError:@"信息不完整,发布失败!"];
        }
    } failure:^(NSError *error) {
        [MBProgressHUD showError:@"请求网络失败!"];
    }];
}



- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}



@end
