//
//  MyConsultViewController.m
//  邻医家
//
//  Created by Daniel on 15/7/13.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "ApplianTool.h"
#import "MyConsultViewController.h"
#import "UIBarButtonItem+ENTER.h"
#import "LDBaseParam.h"
#import "ConsultMessage.h"
#import "LDMessage.h"
#import "ConsultDetailMessage.h"
@interface MyConsultViewController ()
@property (nonatomic,strong) ConsultDetailMessage *detailMsg;
@end

@implementation MyConsultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setConsultMsg:(ConsultMessage *)consultMsg
{
    _consultMsg = consultMsg;
    [self loadData];
}
- (void)loadData
{
    LDBaseParam *param = [LDBaseParam paramWithId:self.consultMsg.id];
    [ApplianTool myconsultDetailWithParam:param success:^(ConsultDetailMessage *detail) {
        self.detailMsg = detail;
    } failure:^(NSError *error) {
        
    }];
}
- (void)setDetailMsg:(ConsultDetailMessage *)detailMsg
{
    _detailMsg = detailMsg;
    NSString *rightTitle = nil;
    if (detailMsg.gsstatus == 1) {
        rightTitle = @"未录取";
        }else if(detailMsg.gsstatus == 2)
        {
            rightTitle = @"已录取";
        }
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:nil action:nil title:rightTitle];
    self.clientToChat = detailMsg.clientNumber;
    self.singleLine = NO;
    
    if (detailMsg.type == 1) {
        //开刀
        [self setupMessage0:detailMsg];
        
    }else if(detailMsg.type == 2){//疑难杂症
        [self setupMessage1:detailMsg];
    }else if(detailMsg.type == 3){//临时会诊
        [self setupMessage2:detailMsg];
    }else if(detailMsg.type == 4){//自由转诊
        [self setupMessage3:detailMsg];
    }
 
}
- (void)setupMessage1:(ConsultDetailMessage *)detailMsg
{
    LDMessage *message0 = [LDMessage messageWithFirstTitle:@"科室" secondTitle:detailMsg.department];
    LDMessage *message1 = [LDMessage messageWithFirstTitle:@"待查疾病名称" secondTitle:detailMsg.illness];
    LDMessage *message2 = [LDMessage messageWithFirstTitle:@"患者病例摘要" secondTitle:detailMsg.caseAbstract];
    LDMessage *message3 = [LDMessage messageWithFirstTitle:@"会诊约定时间" secondTitle:detailMsg.time];
    LDMessage *message4 = [LDMessage messageWithFirstTitle:@"会诊约定地址" secondTitle:detailMsg.location];
    LDMessage *message5 = [LDMessage messageWithFirstTitle:@"详细地址" secondTitle:detailMsg.address];
    LDMessage *message6 = [LDMessage messageWithFirstTitle:@"医院名称" secondTitle:detailMsg.hospital];
    LDMessage *message7 = [LDMessage messageWithFirstTitle:@"拟邀医生技术职位" secondTitle:detailMsg.jobType];
    LDMessage *message8 = [LDMessage messageWithFirstTitle:@"是否住院" secondTitle:detailMsg.ishospital];
    
    self.title = @"会诊详情";
    self.messages = @[message0,message1,message2,message3,message4,message5,message6,message7,message8];
}
- (void)setupMessage2:(ConsultDetailMessage *)detailMsg
{
    self.title = @"临时会诊详情";
    LDMessage *message0 = [LDMessage messageWithFirstTitle:@"科室" secondTitle:detailMsg.department];
    LDMessage *message1 = [LDMessage messageWithFirstTitle:@"临时坐诊时间" secondTitle:detailMsg.time];
    LDMessage *message2 = [LDMessage messageWithFirstTitle:@"临时坐诊地址" secondTitle:detailMsg.location];
    LDMessage *message3 = [LDMessage messageWithFirstTitle:@"详细地址" secondTitle:detailMsg.address];
    LDMessage *message4 = [LDMessage messageWithFirstTitle:@"医院名称" secondTitle:detailMsg.hospital];
    LDMessage *message5 = [LDMessage messageWithFirstTitle:@"拟邀医生技术职位" secondTitle:detailMsg.jobType];
    LDMessage *message6 = [LDMessage messageWithFirstTitle:@"是否住院" secondTitle:detailMsg.ishospital];
    self.messages = @[message0,message1,message2,message3,message4,message5,message6];
}
- (void)setupMessage3:(ConsultDetailMessage *)detialMsg
{
    self.title = @"自由转诊详情";
    LDMessage *message0 = [LDMessage messageWithFirstTitle:@"科室" secondTitle:detialMsg.department];
    LDMessage *message1 = [LDMessage messageWithFirstTitle:@"病人姓名" secondTitle:detialMsg.patientName];
    LDMessage *message2 = [LDMessage messageWithFirstTitle:@"身份证号" secondTitle:detialMsg.idcardNo];
    LDMessage *message3 = [LDMessage messageWithFirstTitle:@"最后一次就医医院" secondTitle:detialMsg.lastHospitalDepartment];
    LDMessage *message4 = [LDMessage messageWithFirstTitle:@"最后一次疾病诊断" secondTitle:detialMsg.lastDiagnose];
    LDMessage *message5 = [LDMessage messageWithFirstTitle:@"拟转诊就医地址" secondTitle:detialMsg.locationToGo];
    LDMessage *message6 = [LDMessage messageWithFirstTitle:@"详细地址" secondTitle:detialMsg.address];
    LDMessage *message7 = [LDMessage messageWithFirstTitle:@"接诊医师的专业" secondTitle:detialMsg.profession];
    LDMessage *message8 = [LDMessage messageWithFirstTitle:@"接诊医师的职务" secondTitle:detialMsg.jobType];
    LDMessage *message9 = [LDMessage messageWithFirstTitle:@"是否住院" secondTitle:detialMsg.ishospital];
    LDMessage *message10 = [LDMessage messageWithFirstTitle:@"转诊目的" secondTitle:detialMsg.purpose];
    LDMessage *message11 = [LDMessage messageWithFirstTitle:@"是否需要VIP" secondTitle:detialMsg.isVIP];
    LDMessage *message12 = [LDMessage messageWithFirstTitle:@"是否需要抢救" secondTitle:detialMsg.idfirstaid];
    self.messages = @[message0,message1,message2,message3,message4,message5,message6,message7,message8,message9,message10,message11,message12];
}
- (void)setupMessage0:(ConsultDetailMessage *)detailMsg
{
    LDMessage *message0 = [LDMessage messageWithFirstTitle:@"科室" secondTitle:detailMsg.department];
    LDMessage *message1 = [LDMessage messageWithFirstTitle:@"疾病名称" secondTitle:detailMsg.illness];
    LDMessage *message2 = [LDMessage messageWithFirstTitle:@"手术名称" secondTitle:detailMsg.opreationName];
    LDMessage *message3 = [LDMessage messageWithFirstTitle:@"手术台数" secondTitle:[NSString stringWithFormat:@"%d",detailMsg.operationNum]];
    LDMessage *message4 = [LDMessage messageWithFirstTitle:@"手术约定时间" secondTitle:detailMsg.time];
    LDMessage *message5 = [LDMessage messageWithFirstTitle:@"手术约定地址" secondTitle:detailMsg.location];
    LDMessage *message6 = [LDMessage messageWithFirstTitle:@"详细地址" secondTitle:detailMsg.address];
    LDMessage *message7 = [LDMessage messageWithFirstTitle:@"医院名称" secondTitle:detailMsg.hospital];
    LDMessage *message8 = [LDMessage messageWithFirstTitle:@"拟邀医生职位" secondTitle:detailMsg.jobType];
    LDMessage *message9 = [LDMessage messageWithFirstTitle:@"是否住院" secondTitle:detailMsg.ishospital];

    self.title = @"开刀详情";
    self.messages = @[message0,message1,message2,message3,message4,message5,message6,message7,message8,message9];
}
@end









