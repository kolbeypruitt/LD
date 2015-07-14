//
//  MyInviteDetailController.m
//  邻医家
//
//  Created by Daniel on 15/7/12.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "MyInviteDetailController.h"
#import "LDMessageCell.h"
#import "ChatViewController.h"
#import "LDMessage.h"
#import "Common.h"
#import "ApplianTool.h"
#import "LDBaseParam.h"
#import "InviteDocMessage.h"
#import "InviteDocDetail.h"
#import "MJExtension.h"
@interface MyInviteDetailController ()
@property (nonatomic,weak) UIButton  *contactBtn;
@property (nonatomic,strong) InviteDocDetail *doctorDetail;
@end

@implementation MyInviteDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self setup];
}
- (void)loadData
{
    LDBaseParam *param = [LDBaseParam paramWithId:self.inviteDocMessage.id];
    [ApplianTool myInviteDetailWithParam:param success:^(id result) {
        if ([result[@"status"] isEqualToString:@"S"]) {
            self.doctorDetail = [InviteDocDetail objectWithKeyValues:result[@"seekDoctor"]];
        }
    } failure:^(NSError *error) {
        
    }];
    
}
- (void)setDoctorDetail:(InviteDocDetail *)doctorDetail
{
    _doctorDetail = doctorDetail;
    LDMessage *message0 = [LDMessage messageWithFirstTitle:@"姓名" secondTitle:doctorDetail.name];
    LDMessage *message1 = [LDMessage messageWithFirstTitle:@"身份证号" secondTitle:doctorDetail.idcardNo];
    LDMessage *message2 = [LDMessage messageWithFirstTitle:@"性别" secondTitle:doctorDetail.gender];
    LDMessage *message3 = [LDMessage messageWithFirstTitle:@"最后一次就医医院" secondTitle:doctorDetail.lastHospital];
    LDMessage *message4 = [LDMessage messageWithFirstTitle:@"最后一次就医科室" secondTitle:doctorDetail.lastDepartment];
    LDMessage *message5 = [LDMessage messageWithFirstTitle:@"最后一次诊断" secondTitle:doctorDetail.lastDiagnose];
    LDMessage *message6 = [LDMessage messageWithFirstTitle:@"地址" secondTitle:doctorDetail.address];
    LDMessage *message7 = [LDMessage messageWithFirstTitle:@"邀请医生的专业" secondTitle:doctorDetail.profession];
    LDMessage *message8 = [LDMessage messageWithFirstTitle:@"邀请医生的职位" secondTitle:doctorDetail.job];
    LDMessage *message9 = [LDMessage messageWithFirstTitle:@"请医目的" secondTitle:doctorDetail.purpose];
    LDMessage *message10 = [LDMessage messageWithFirstTitle:@"VIP" secondTitle:doctorDetail.isVIP];
    LDMessage *message11 = [LDMessage messageWithFirstTitle:@"备注" secondTitle:doctorDetail.ramark];
    self.messages = @[message0,message1,message2,message3,message4,message5,message6,message7,message8,message9,message10,message11];
    self.clientToChat = doctorDetail.clientNumber;
    self.singleLine = NO;
}
- (void)setup
{
    self.title = @"自由请医详情";
    
}


@end

