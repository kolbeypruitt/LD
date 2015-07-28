//
//  AppendInviteController.m
//  邻医家
//
//  Created by Daniel on 15/7/14.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "MBProgressHUD+MJ.h"
#import "LDInputView.h"
#import "NSString+Check.h"
#import "Common.h"
#import "MJExtension.h"
#import "AppendInviteParam.h"
#import "CommitMessage.h"
#import "BaseResult.h"
#import "AppendInviteTool.h"
#import "AppendInviteController.h"
#import "LDInputMessage.h"
#import "ZonePickerDelegate.h"
#import "SexDelegate.h"
#import "DepartmentDelegate.h"
#import "NiyaoDelegate.h"
#import "FirstDepartmentDelegate.h"
#import "InvitePurposeDelegate.h"
#import "VipDelegate.h"
@interface AppendInviteController ()

@end

@implementation AppendInviteController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"增加自由请医服务";
    [self addMessages];
    
}
- (void)addMessages
{
    
    LDInputMessage *message1 = [LDInputMessage messageWithFirstTitle:@"身份证号" placeHolder:@"请输入身份证号" optionDelegate:nil];
    LDInputMessage *message2 = [LDInputMessage messageWithFirstTitle:@"性别" placeHolder:@"请选择性别" optionDelegate:[[SexDelegate alloc] init]];
    LDInputMessage *message3 = [LDInputMessage messageWithFirstTitle:@"病人情况描述" placeHolder:@"请输入描述" optionDelegate:nil];
    LDInputMessage *message4 = [LDInputMessage messageWithFirstTitle:@"最后一次就医医院" placeHolder:@"请输入就医医院" optionDelegate:nil];
    LDInputMessage *message5 = [LDInputMessage messageWithFirstTitle:@"最后一次就医科室" placeHolder:@"请点击选择" optionDelegate:[[DepartmentDelegate alloc] init]];
    LDInputMessage *message6 = [LDInputMessage messageWithFirstTitle:@"最后一次诊断" placeHolder:@"请输入诊断" optionDelegate:nil];
    LDInputMessage *message7 = [LDInputMessage messageWithFirstTitle:@"地点" placeHolder:@"请点击选择" optionDelegate:[[ZonePickerDelegate alloc] init]];
    LDInputMessage *message8 = [LDInputMessage messageWithFirstTitle:@"详细地址" placeHolder:@"请输入请医地址" optionDelegate:nil];
    LDInputMessage *message9 = [LDInputMessage messageWithFirstTitle:@"邀请医生的专业" placeHolder:@"请输入医生专业" optionDelegate:nil];
    LDInputMessage *message10 = [LDInputMessage messageWithFirstTitle:@"邀请医生的职位" placeHolder:@"请选择职位" optionDelegate:[[NiyaoDelegate alloc] init]];
    LDInputMessage *message11 = [LDInputMessage messageWithFirstTitle:@"邀请医生的地址" placeHolder:@"请选择地址" optionDelegate:[[FirstDepartmentDelegate alloc] init]];
    LDInputMessage *message12 = [LDInputMessage messageWithFirstTitle:@"请医目的" placeHolder:@"请选择请医目的" optionDelegate:[[InvitePurposeDelegate alloc] init]];
    LDInputMessage *message13 = [LDInputMessage messageWithFirstTitle:@"VIP" placeHolder:@"是否需要VIP" optionDelegate:[[VipDelegate alloc] init]];
    LDInputMessage *message14 = [LDInputMessage messageWithFirstTitle:@"备注" placeHolder:@"请输入备注" optionDelegate:nil];
    self.inputMessages = @[message1,message2,message3,message4,message5,message6,message7,message8,message9,message10,message11,message12,message13,message14];
}
- (void)commitBtnClicked
{
    if ([self messageComplete]) {
        [AppendInviteTool appendInviteWithParam:[self fillParam] success:^(BaseResult *result) {
            if ([result.status isEqualToString:SUCCESSSTATUS]) {
                [DefaultCenter postNotificationName:FREEINVITENEEDREFRESHNOTIFICATION object:self];
                [self.navigationController popViewControllerAnimated:YES];
            }else
            {
                [MBProgressHUD showError:@"发布失败!"];
            }
        } failure:^(NSError *error) {
            [MBProgressHUD showError:@"请求网络失败!"];
        }];
    }
}
- (BOOL)messageComplete
{
    LDInputView *inputView = self.inputViews[0];
    UITextField *textfield = inputView.inputField;
    if (![textfield.text dg_isValidIdentity]) {
        [MBProgressHUD showError:@"请输入正确的身份证号"];
        return NO;
    }
    return [super messageComplete];
}
- (NSDictionary *)fillParam
{
    AppendInviteParam *param = [[AppendInviteParam alloc] init];
    NSString *idcardNo = [self.commitMessages[0] stringMsg];
    int gender = [self.commitMessages[1] intMsg];
    NSString *lastHospital = [self.commitMessages[3] stringMsg];
    NSString *lastDep = [NSString stringWithFormat:@"%d",[self.commitMessages[4] intMsg]];
    NSString *lastDia = [self.commitMessages[5] stringMsg];
    int location = [self.commitMessages[6] intMsg];
    NSString *address = [self.commitMessages[7] stringMsg];
    NSString *profession =[self.commitMessages[8] stringMsg];
    NSString *job = [self.commitMessages[9] stringMsg];
    int doctorLocation = [self.commitMessages[10] intMsg];
    NSString *purpose = [self.commitMessages[11] stringMsg];
    int isvip = [self.commitMessages[12] intMsg];
    NSString *remark = [self.commitMessages[13] stringMsg];
    param.type = 1;
    param.location = location;
    param.doctorLocation = doctorLocation;
    param.idcardNo = idcardNo;
    param.gender = gender;
    param.lastHospital = lastHospital;
    param.lastDepartment = lastDep;
    param.lastDiagnose = lastDia;
    param.address = address;
    param.profession = profession;
    param.job = job;
    param.purpose = purpose;
    param.isvip = isvip;
    param.remark = remark;
    NSMutableDictionary *dictparam = [param.keyValues mutableCopy];
    [dictparam setObject:[self.commitMessages[2] stringMsg] forKey:@"description"];
    return dictparam;
}

@end
