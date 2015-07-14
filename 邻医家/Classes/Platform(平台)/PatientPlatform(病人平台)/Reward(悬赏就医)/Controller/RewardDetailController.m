//
//  RewardDetailController.m
//  邻医家
//
//  Created by Daniel on 15/6/17.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "FreeInviteHeaderView.h"
#import "WithDrawDocTool.h"
#import "AllInviteParam.h"
#import "BaseResult.h"
#import "LDMessage.h"
#import "MBProgressHUD+MJ.h"
#import "WithDrawDocTool.h"
#import "AcceptedDocController.h"
#import "FreeInviteDeResult.h"
#import "PatienAllDocController.h"
#import "InviteDocMessage.h"
#import "FreeDetailMsgParam.h"
#import "PatientInviteDetailTool.h"
#import "UILabel+LD.h"
#import "Common.h"
#import "UIBarButtonItem+ENTER.h"
#import "UIButton+LD.h"
#import "PatienInviteDetail.h"
#import "RewardDetailController.h"

@interface RewardDetailController ()
@property (nonatomic,strong) PatienInviteDetail *detailMsg;
@property (nonatomic,weak) FreeInviteHeaderView *headView;
@end

@implementation RewardDetailController
- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [super initWithStyle:UITableViewStyleGrouped];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self loadData];
}
- (void)setup
{
    self.title = @"悬赏请医详情";
    self.view.backgroundColor = IWColor(226, 226, 226);
    self.navigationItem.rightBarButtonItem = nil;
    [self setNav];
}
- (void)setNav
{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(retreat) title:@"撤销"];
}
- (void)retreat
{
    AllInviteParam *param = [AllInviteParam paramWithId:self.message.id];
    [WithDrawDocTool withDrawDocWithParam:param success:^(BaseResult *result) {
        if ([result.status isEqualToString:SUCCESSSTATUS]) {
            [self postWithDrawNotification];
            [self.navigationController popViewControllerAnimated:YES];
        }else if([result.status isEqualToString:FAILURESTATUS])
        {
            [MBProgressHUD showError:result.errorMsg];
        }
    } failure:^(NSError *error) {
        [MBProgressHUD showError:@"请求失败!"];
    }];
}
- (void)postWithDrawNotification
{
    [DefaultCenter postNotificationName:FREEINVITENEEDREFRESHNOTIFICATION object:self];
}


- (void)receiveBtnClicked
{
    PatienAllDocController *allVC = [[PatienAllDocController alloc] init];
    allVC.detailMsg = self.detailMsg;
    [self.navigationController pushViewController:allVC animated:YES];
}
- (void)confirmBtnClicked
{
    AcceptedDocController *accept = [[AcceptedDocController alloc] init];
    accept.detailMsg = self.detailMsg;
    [self.navigationController pushViewController:accept animated:YES];
}

- (void)loadData
{
    FreeDetailMsgParam *param = [FreeDetailMsgParam paramWithId:self.message.id];
    [PatientInviteDetailTool patientInviteDetailWithParam:param success:^(FreeInviteDeResult *result) {
        self.detailMsg = result.seekDoctor;
    } failure:^(NSError *error) {
        
    }];
}
- (void)setDetailMsg:(PatienInviteDetail *)detailMsg
{
    _detailMsg = detailMsg;
    LDMessage *message0 = [LDMessage messageWithFirstTitle:@"姓名" secondTitle:detailMsg.name];
    LDMessage *message1 = [LDMessage messageWithFirstTitle:@"身份证号" secondTitle:detailMsg.idcardNo];
    LDMessage *message2 = [LDMessage messageWithFirstTitle:@"性别" secondTitle:detailMsg.gender];
    LDMessage *message3 = [LDMessage messageWithFirstTitle:@"最后一次就医医院" secondTitle:detailMsg.lastHospital];
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
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (self.message.succeed == 1) {
        return nil;
    }else{
        FreeInviteHeaderView *inviteHeader = [[FreeInviteHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,80)];
        [inviteHeader.acceptedBtn addTarget:self action:@selector(confirmBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        [inviteHeader.allBtn addTarget:self action:@selector(receiveBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        self.headView = inviteHeader;
        return inviteHeader;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (self.message.succeed == 1) {
        return 0;
    }else
    {
        return 80;
    }
}

@end













