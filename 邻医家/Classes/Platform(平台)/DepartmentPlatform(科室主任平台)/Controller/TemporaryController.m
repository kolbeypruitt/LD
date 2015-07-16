//
//  TemporaryController.m
//  邻医家
//
//  Created by Daniel on 15/6/7.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "TimeDeletage.h"
#import "LDInputMessage.h"
#import "CommitMessage.h"
#import "TemporaryController.h"
#import "LDNotification.h"
#import "Common.h"
#import "UIBarButtonItem+ENTER.h"
#import "HospitalEnterTextField.h"
#import "MBProgressHUD+MJ.h"
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
#import "UIBarButtonItem+ENTER.h"
@interface TemporaryController () <UITextFieldDelegate>
@end

@implementation TemporaryController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}


- (void)setup
{
    self.title = @"临时转诊";
    self.view.backgroundColor = IWColor(226, 226, 226);
    [self setNav];
    [self addMessages];
}
- (void)addMessages
{
    LDInputMessage *message0 = [LDInputMessage messageWithFirstTitle:@"科室" placeHolder:@"选择科室" optionDelegate:[[SingleDepartmentDelegate alloc] init]];
    LDInputMessage *message1 = [LDInputMessage messageWithFirstTitle:@"临时坐诊时间" placeHolder:@"请选择时间" optionDelegate:[[TimeDeletage alloc] init]];
    LDInputMessage *message2 = [LDInputMessage messageWithFirstTitle:@"临时坐诊地址" placeHolder:@"请选择地址" optionDelegate:[[ZonePickerDelegate alloc] init]];
    LDInputMessage *message3 = [LDInputMessage messageWithFirstTitle:@"详细地址" placeHolder:@"请输入详细地址" optionDelegate:nil ];
    LDInputMessage *message4 = [LDInputMessage messageWithFirstTitle:@"医院名称" placeHolder:@"请输入医院名称" optionDelegate:nil ];
    LDInputMessage *message5 = [LDInputMessage messageWithFirstTitle:@"拟邀医生技术职位" placeHolder:@"请选择医生职位" optionDelegate:[[NiyaoDelegate alloc] init] ];
    LDInputMessage *message6 = [LDInputMessage messageWithFirstTitle:@"是否住院" placeHolder:@"请选择" optionDelegate:[[IshospitalDelegate alloc] init]];
    self.inputMessages = @[message0,message1,message2,message3,message4,message5,message6];
}
- (void)commitBtnClicked
{
    if ([self messageComplete]) {
        [self post];
    }
}
- (void)setNav
{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(post) title:@"发布"];
}
- (void)post
{
    PostConsultParam *param = [[PostConsultParam alloc] init];
    
    param.consultationType = 3;
    param.department = [self.commitMessages[0] intMsg];
    param.time = [self.commitMessages[1] stringMsg];
    param.location = [self.commitMessages[2] intMsg];
    param.address = [self.commitMessages[3] stringMsg];
    param.appointHospital = [self.commitMessages[4] stringMsg];
    param.doctorJob = [self.commitMessages[5] stringMsg];
    param.isHospital = [self.commitMessages[6] intMsg];
    
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







