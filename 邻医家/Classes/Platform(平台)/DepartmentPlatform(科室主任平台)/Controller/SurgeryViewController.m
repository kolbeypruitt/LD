//
//  SurgeryViewController.m
//  邻医家
//
//  Created by Daniel on 15/6/6.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDInputView.h"
#import "CommitMessage.h"
#import "TimeDeletage.h"
#import "MBProgressHUD+MJ.h"
#import "LDNotification.h"
#import "IshospitalDelegate.h"
#import "PostConsultParam.h"
#import "NiyaoDelegate.h"
#import "BaseResult.h"
#import "LDEnterData.h"
#import "SingleDepartmentDelegate.h"
#import "ZonePickerDelegate.h"
#import "ActionSheetCustomPicker+LD.h"
#import "ActionSheetDatePicker+LD.h"
#import "PostConsultTool.h"
#import "SurgeryViewController.h"
#import "Common.h"
#import "HospitalEnterTextField.h"
#import "LDInputMessage.h"
#import "NSString+Check.h"
@interface SurgeryViewController ()

@end

@implementation SurgeryViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.title = @"开刀";
    [self setNav];
    [self addMessages];
}
- (void)addMessages
{
    LDInputMessage *message0 = [LDInputMessage messageWithFirstTitle:@"科室" placeHolder:@"选择科室" optionDelegate:[[SingleDepartmentDelegate alloc] init]];
    LDInputMessage *message1 = [LDInputMessage messageWithFirstTitle:@"疾病名称" placeHolder:@"请输入疾病名称" optionDelegate:nil ];
    LDInputMessage *message2 = [LDInputMessage messageWithFirstTitle:@"手术名称" placeHolder:@"请输入手术名称" optionDelegate:nil ];
    LDInputMessage *message3 = [LDInputMessage messageWithFirstTitle:@"手术台数" placeHolder:@"请输入手术台数" optionDelegate:nil ];
    LDInputMessage *message4 = [LDInputMessage messageWithFirstTitle:@"手术约定时间" placeHolder:@"请选择时间" optionDelegate:[[TimeDeletage alloc] init]];
    LDInputMessage *message5 = [LDInputMessage messageWithFirstTitle:@"手术约定地址" placeHolder:@"请选择地址" optionDelegate:[[ZonePickerDelegate alloc] init]];
    LDInputMessage *message6 = [LDInputMessage messageWithFirstTitle:@"详细地址" placeHolder:@"请输入详细地址" optionDelegate:nil ];
    LDInputMessage *message7 = [LDInputMessage messageWithFirstTitle:@"医院名称" placeHolder:@"请输入医院名称" optionDelegate:nil ];
    LDInputMessage *message8 = [LDInputMessage messageWithFirstTitle:@"拟邀医生技术职位" placeHolder:@"请选择医生职位" optionDelegate:[[NiyaoDelegate alloc] init] ];
    LDInputMessage *message9 = [LDInputMessage messageWithFirstTitle:@"是否住院" placeHolder:@"请选择" optionDelegate:[[IshospitalDelegate alloc] init]];
    self.inputMessages = @[message0,message1,message2,message3,message4,message5,message6,message7,message8,message9];
}
- (void)setNav
{
   
    self.view.backgroundColor = IWColor(226, 226, 226);
}
- (void)commitBtnClicked
{
    if ([self messageComplete]) {
        [self post];
    }
}
- (BOOL)messageComplete
{
        LDInputView *inputView = self.inputViews[3];
        UITextField *textfield = inputView.inputField;
        if (![textfield.text dg_isNumber]) {
            [MBProgressHUD showError:@"手术台数请输入数字"];
            return NO;
        }
    return [super messageComplete];
}
- (void)post
{
    PostConsultParam *param = [[PostConsultParam alloc] init];
    
    param.consultationType = 1;
    param.department = [self.commitMessages[0] intMsg];
    param.illness = [self.commitMessages[1] stringMsg];
    param.operationName = [self.commitMessages[2] stringMsg];
    param.operationNum = [[self.commitMessages[3] stringMsg] intValue];
    param.time = [self.commitMessages[4] stringMsg];
    param.location = [self.commitMessages[5] intMsg];
    param.address = [self.commitMessages[6] stringMsg];
    param.appointHospital = [self.commitMessages[7] stringMsg];
    param.doctorJob = [self.commitMessages[8] stringMsg];
    param.isHospital = [self.commitMessages[9] intMsg];
    
    [PostConsultTool postConsulWithParam:param success:^(BaseResult *result) {
        if ([result.status isEqualToString:SUCCESSSTATUS]) {
            [DefaultCenter postNotificationName:DEPARTMENTMSGREFRESHNOTIFICATION object:self];
            [self.navigationController popViewControllerAnimated:YES];
        }else
        {
            [MBProgressHUD showError:result.errorMsg];
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










