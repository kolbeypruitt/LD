//
//  FreeDetailMsgController.m
//  邻医家
//
//  Created by Daniel on 15/6/14.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDMessage.h"
#import "UIBarButtonItem+ENTER.h"
#import "FreeDetailMsgController.h"
#import "FreeMsgResult.h"
#import "ReplyInviteTool.h"
#import "BaseResult.h"
#import "FreeDetailMsgParam.h"
#import "FreeDetailMsgTool.h"
#import "InviteDocMessage.h"
#import "Common.h"
#import "InviteDocDetail.h"
#import "LDNotification.h"
@interface FreeDetailMsgController ()
@property (nonatomic,strong) InviteDocDetail *detailMsg;
@end

@implementation FreeDetailMsgController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}


- (void)loadData
{
     FreeDetailMsgParam *param = [FreeDetailMsgParam paramWithId:self.message.id];
    
    [FreeDetailMsgTool getSDInfoWithParam:param success:^(FreeMsgResult *result) {
    self.detailMsg = result.seekDoctor;
    } failure:^(NSError *error) {
    
    }];
    
}
- (void)setDetailMsg:(InviteDocDetail *)detailMsg
{
    _detailMsg = detailMsg;
    if (detailMsg.sdstatus == 1) {
        self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(acceptInvite) title:@"接受"];
    }else if(detailMsg.sdstatus == 2)
    {
        self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:nil action:nil title:@"已录取"];
    }else if(detailMsg.sdstatus == 0)
    {
        self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:nil action:nil title:@"请医响应"];
    }
    self.clientToChat = detailMsg.clientNumber;
    self.singleLine = NO;
    
    if (self.message.type == 1) {//自由请医
        [self setMessage0:detailMsg];
    }else if(self.message.type == 2)//悬赏请医
    {
        [self setMessage1:detailMsg];
    }
}
- (void)acceptInvite
{
    FreeDetailMsgParam *param = [FreeDetailMsgParam paramWithId:self.detailMsg.id];
    [ReplyInviteTool replyInviteMsgWithParam:param success:^(BaseResult *result) {
        if ([result.status isEqualToString:@"S"]) {
            [DefaultCenter postNotificationName:INVITEREFRESHENOTIFICATION object:self];
            [self.navigationController popViewControllerAnimated:YES];
        }
        
    } failure:^(NSError *error) {
        
    }];
}
- (void)setMessage0:(InviteDocDetail *)detailMsg
{
    self.title = @"自由请医详情";
    LDMessage *message0 = [LDMessage messageWithFirstTitle:@"姓名" secondTitle:detailMsg.name];
    LDMessage *message1 = [LDMessage messageWithFirstTitle:@"身份证号" secondTitle:detailMsg.idcardNo];
    LDMessage *message2 = [LDMessage messageWithFirstTitle:@"性别" secondTitle:detailMsg.gender];
    LDMessage *message3 = [LDMessage messageWithFirstTitle:@"最后一就医医院" secondTitle:detailMsg.lastHospital];
    LDMessage *message4 = [LDMessage messageWithFirstTitle:@"最后一次就医科室" secondTitle:detailMsg.lastDepartment];
    LDMessage *message5 = [LDMessage messageWithFirstTitle:@"最后一次诊断" secondTitle:detailMsg.lastDiagnose];
    LDMessage *message6 = [LDMessage messageWithFirstTitle:@"地址" secondTitle:detailMsg.address];
    LDMessage *message7 = [LDMessage messageWithFirstTitle:@"邀请医生的专业" secondTitle:detailMsg.profession];
    LDMessage *message8 = [LDMessage messageWithFirstTitle:@"邀请医生的职位" secondTitle:detailMsg.job];
    LDMessage *message9 = [LDMessage messageWithFirstTitle:@"请医目的" secondTitle:detailMsg.purpose];
    LDMessage *message10 = [LDMessage messageWithFirstTitle:@"VIP" secondTitle:detailMsg.isVIP];
    LDMessage *message11 = [LDMessage messageWithFirstTitle:@"备注" secondTitle:detailMsg.ramark];
    self.messages = @[message0,message1,message2,message3,message4,message5,message6,message7,message8,message9,message10,message11];
    
}
- (void)setMessage1:(InviteDocDetail *)detailMsg
{
    self.title = @"悬赏请医详情";
    LDMessage *message0 = [LDMessage messageWithFirstTitle:@"悬赏金额" secondTitle:[NSString stringWithFormat:@"%d",detailMsg.money]];
    LDMessage *message1 = [LDMessage messageWithFirstTitle:@"姓名" secondTitle:detailMsg.name];
    LDMessage *message2 = [LDMessage messageWithFirstTitle:@"身份证号" secondTitle:detailMsg.idcardNo];
    LDMessage *message3 = [LDMessage messageWithFirstTitle:@"性别" secondTitle:detailMsg.gender];
    LDMessage *message4 = [LDMessage messageWithFirstTitle:@"最后一次就医医院" secondTitle:detailMsg.lastHospital];
    LDMessage *message5 = [LDMessage messageWithFirstTitle:@"最后一次就医科室" secondTitle:detailMsg.lastDepartment];
    LDMessage *message6 = [LDMessage messageWithFirstTitle:@"最后一次诊断" secondTitle:detailMsg.lastDiagnose];
    LDMessage *message7 = [LDMessage messageWithFirstTitle:@"地址" secondTitle:detailMsg.address];
    LDMessage *message8 = [LDMessage messageWithFirstTitle:@"邀请医生的专业" secondTitle:detailMsg.profession];
    LDMessage *message9 = [LDMessage messageWithFirstTitle:@"邀请医生的职位" secondTitle:detailMsg.job];
    LDMessage *message10 = [LDMessage messageWithFirstTitle:@"请医目的" secondTitle:detailMsg.purpose];
    LDMessage *message11 = [LDMessage messageWithFirstTitle:@"VIP" secondTitle:detailMsg.isVIP];
    LDMessage *message12 = [LDMessage messageWithFirstTitle:@"备注" secondTitle:detailMsg.ramark];
    self.messages = @[message0,message1,message2,message3,message4,message5,message6,message7,message8,message9,message10,message11,message12];
}
@end


















