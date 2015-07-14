//
//  AppendRewardController.m
//  邻医家
//
//  Created by Daniel on 15/6/18.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "BaseResult.h"
#import "AppendInviteTool.h"
#import "MBProgressHUD+MJ.h"
#import "Common.h"
#import "AppendRewardController.h"
#import "MJExtension.h"
#import "AppendInviteParam.h"
#import "CommitMessage.h"
#import "BaseResult.h"
#import "AppendInviteTool.h"
#import "LDInputMessage.h"
#import "ZonePickerDelegate.h"
#import "SexDelegate.h"
#import "DepartmentDelegate.h"
#import "NiyaoDelegate.h"
#import "FirstDepartmentDelegate.h"
#import "InvitePurposeDelegate.h"
#import "VipDelegate.h"
@interface AppendRewardController ()

@end

@implementation AppendRewardController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupChild];
}
- (void)setupChild
{
    self.navigationItem.title = @"增加悬赏请医";
    self.navigationItem.rightBarButtonItem = nil;
    [self addMessages];
}
- (void)addMessages
{
    LDInputMessage *message0 = [LDInputMessage messageWithFirstTitle:@"悬赏金额" placeHolder:@"请输入悬赏金额" optionDelegate:nil];
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
    self.inputMessages = @[message0,message1,message2,message3,message4,message5,message6,message7,message8,message9,message10,message11,message12,message13,message14];
}
- (NSDictionary *)fillParam
{
    AppendInviteParam *param = [[AppendInviteParam alloc] init];
    int money = [[self.commitMessages[0] stringMsg] integerValue];
    NSString *idcardNo = [self.commitMessages[1] stringMsg];
    int gender = [self.commitMessages[2] intMsg];
    NSString *lastHospital = [self.commitMessages[4] stringMsg];
    NSString *lastDep = [NSString stringWithFormat:@"%d",[self.commitMessages[5] intMsg]];
    NSString *lastDia = [self.commitMessages[6] stringMsg];
    int location = [self.commitMessages[7] intMsg];
    NSString *address = [self.commitMessages[8] stringMsg];
    NSString *profession =[self.commitMessages[9] stringMsg];
    NSString *job = [self.commitMessages[10] stringMsg];
    int doctorLocation = [self.commitMessages[11] intMsg];
    NSString *purpose = [self.commitMessages[12] stringMsg];
    int isvip = [self.commitMessages[13] intMsg];
    NSString *remark = [self.commitMessages[14] stringMsg];
    param.type = 2;
    param.money = money;
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
    [dictparam setObject:[self.commitMessages[3] stringMsg] forKey:@"description"];
    return dictparam;
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
@end
