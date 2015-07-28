//
//  FreeForwardController.m
//  邻医家
//
//  Created by Daniel on 15/6/6.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "TimeDeletage.h"
#import "LDInputView.h"
#import "NSString+Check.h"
#import "LDNotification.h"
#import "ConsultDetailParam.h"
#import "ForwardDelegate.h"
#import "VipDelegate.h"
#import "MBProgressHUD+MJ.h"
#import "PostConsultTool.h"
#import "IshospitalDelegate.h"
#import "PostConsultParam.h"
#import "NiyaoDelegate.h"
#import "BaseResult.h"
#import "LDEnterData.h"
#import "SingleDepartmentDelegate.h"
#import "ZonePickerDelegate.h"
#import "PostConsultTool.h"
#import "FreeForwardController.h"
#import "Common.h"
#import "TimeDeletage.h"
#import "LDInputMessage.h"
#import "CommitMessage.h"
@interface FreeForwardController ()
@end

@implementation FreeForwardController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.title = @"自由转诊";
    [self addMessages];
}
- (void)addMessages
{
    LDInputMessage *messaeg0 = [LDInputMessage messageWithFirstTitle:@"病人姓名" placeHolder:@"请输入病人姓名" optionDelegate:nil];
    LDInputMessage *messaeg1 = [LDInputMessage messageWithFirstTitle:@"身份证号" placeHolder:@"请输入身份证号" optionDelegate:nil];
    LDInputMessage *messaegx = [LDInputMessage messageWithFirstTitle:@"转诊时间" placeHolder:@"" optionDelegate:[[TimeDeletage alloc] init]];
    LDInputMessage *messaeg2 = [LDInputMessage messageWithFirstTitle:@"最后一次就医医院" placeHolder:@"请输入医院名称" optionDelegate:nil];
    LDInputMessage *messaeg3 = [LDInputMessage messageWithFirstTitle:@"科室" placeHolder:@"请选择科室" optionDelegate:[[SingleDepartmentDelegate alloc] init]];
    LDInputMessage *messaeg4 = [LDInputMessage messageWithFirstTitle:@"最后一次医院诊断" placeHolder:@"请输入诊断详情" optionDelegate:nil];
    LDInputMessage *messaeg5 = [LDInputMessage messageWithFirstTitle:@"拟转诊就医地址" placeHolder:@"请选择地址" optionDelegate:[[ZonePickerDelegate alloc] init]];
    LDInputMessage *messaeg6 = [LDInputMessage messageWithFirstTitle:@"详细地址" placeHolder:@"请输入详细地址" optionDelegate:nil];
    LDInputMessage *messaeg7 = [LDInputMessage messageWithFirstTitle:@"接诊医生专业" placeHolder:@"请输入医师专业" optionDelegate:nil];
    LDInputMessage *messaeg8 = [LDInputMessage messageWithFirstTitle:@"拟邀医生技术职位" placeHolder:@"请输入医生技术职位" optionDelegate:[[NiyaoDelegate alloc] init]];
    LDInputMessage *messaeg9 = [LDInputMessage messageWithFirstTitle:@"是否住院" placeHolder:@"请选择是否住院" optionDelegate:[[IshospitalDelegate alloc] init]];
    LDInputMessage *messaeg10 = [LDInputMessage messageWithFirstTitle:@"转诊目的" placeHolder:@"请选择转诊目的" optionDelegate:[[ForwardDelegate alloc] init]];
    LDInputMessage *messaeg11 = [LDInputMessage messageWithFirstTitle:@"是否需要VIP" placeHolder:@"请选择VIP" optionDelegate:[[VipDelegate alloc] init]];
    LDInputMessage *messaeg12 = [LDInputMessage messageWithFirstTitle:@"是否需要抢救" placeHolder:@"请选择" optionDelegate:[[IshospitalDelegate alloc] init]];
    self.inputMessages = @[messaeg0,messaeg1,messaegx,messaeg2,messaeg3,messaeg4,messaeg5,messaeg6,messaeg7,messaeg8,messaeg9,messaeg10,messaeg11,messaeg12];
}
- (void)post
{
    PostConsultParam *param = [[PostConsultParam alloc] init];
    param.consultationType = 4;

    param.patientName = [self.commitMessages[0] stringMsg];
    param.idcardNo = [self.commitMessages[1] stringMsg];
    param.time = [self.commitMessages[2] stringMsg];
    param.appointHospital = [self.commitMessages[3] stringMsg];
    param.lastHospitalDepartment = [self.commitMessages[4] stringMsg];
    param.department = [self.commitMessages[5] intMsg];
    param.lastDiagnose = [self.commitMessages[6] stringMsg];
    param.hospitalLocationTogo = [self.commitMessages[7] intMsg];
    param.hospitalAddressTogo = [self.commitMessages[8] stringMsg];
    param.profession = [self.commitMessages[9] stringMsg];
    param.doctorJob = [self.commitMessages[0] stringMsg];
    param.isHospital = [self.commitMessages[10] intMsg];
    param.purpose = [self.commitMessages[11] stringMsg];
    param.isvip = [self.commitMessages[12] intMsg];
    param.isfirstaid = [self.commitMessages[13] intMsg];
    
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
- (void)commitBtnClicked
{
    if ([self messageComplete]) {
        [self post];
    }
}

- (BOOL)messageComplete
{
    LDInputView *inputView = self.inputViews[1];
    UITextField *textfield = inputView.inputField;
    if (![textfield.text dg_isValidIdentity]) {
        [MBProgressHUD showError:@"请输入正确身份证号"];
        return NO;
    }
    return [super messageComplete];
}



@end
