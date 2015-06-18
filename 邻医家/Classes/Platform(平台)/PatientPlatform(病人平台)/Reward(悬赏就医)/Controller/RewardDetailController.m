//
//  RewardDetailController.m
//  邻医家
//
//  Created by Daniel on 15/6/17.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "WithDrawDocTool.h"
#import "AllInviteParam.h"
#import "BaseResult.h"
#import "MBProgressHUD+MJ.h"
#import "WithDrawDocTool.h"
#import "AcceptedDocController.h"
#import "FreeInviteDeResult.h"
#import "PatienAllDocController.h"
#import "InviteDocMessage.h"
#import "FreeDetailMsgParam.h"
#import "PatientInviteDetailTool.h"
#import "UILabel+LD.h"
#import "InviteDoctorView.h"
#import "Common.h"
#import "UIBarButtonItem+ENTER.h"
#import "UIButton+LD.h"
#import "PatienInviteDetail.h"
#import "RewardDetailController.h"

@interface RewardDetailController ()
@property (nonatomic,strong) PatienInviteDetail *detailMsg;
@property (nonatomic,weak) UILabel *moneyLabel;
@property (nonatomic,weak) UIButton *receiveBtn;
@property (nonatomic,weak) UIButton *confirmBtn;
@property (nonatomic,weak) InviteDoctorView *scrollView;
@end

@implementation RewardDetailController

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
    [self addCustomViews];
    [self layoutCustomViews];
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

- (void)addCustomViews
{
    UILabel *moneyLabel = [UILabel labelWithTitle:nil font:14 textColor:[UIColor blueColor]];
    moneyLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:moneyLabel];
    self.moneyLabel = moneyLabel;
    
    UIButton *receiveBtn = [UIButton buttonWithTitle:nil
                                                font:14
                                          titleColor:[UIColor whiteColor]
                                              target:self
                                              action:@selector(receiveBtnClicked)];
    [self.view addSubview:receiveBtn];
    self.receiveBtn = receiveBtn;
    self.receiveBtn.backgroundColor = [UIColor purpleColor];
    
    UIButton *confirmBtn = [UIButton buttonWithTitle:nil
                                                font:14
                                          titleColor:[UIColor whiteColor]
                                              target:self
                                              action:@selector(confirmBtnClicked)];
    [self.view addSubview:confirmBtn];
    self.confirmBtn = confirmBtn;
    self.confirmBtn.backgroundColor = [UIColor orangeColor];
    
    InviteDoctorView *scrollView = [[InviteDoctorView alloc] init];
    scrollView.contentSize = CGSizeMake(0, SCREENHEIGHT);
    self.scrollView = scrollView;
    [self.view addSubview:scrollView];
    
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
- (void)layoutCustomViews
{
    CGFloat moneyX = 0;
    CGFloat moneyY = 64;
    CGFloat moneyW = SCREENWIDTH;
    CGFloat moneyH = 30;
    self.moneyLabel.frame = CGRectMake(moneyX, moneyY, moneyW, moneyH);
    
    CGFloat confX = moneyX;
    CGFloat confY = CGRectGetMaxY(self.moneyLabel.frame);
    CGFloat confW = SCREENWIDTH;
    CGFloat confH = 30;
    self.confirmBtn.frame = CGRectMake(confX, confY, confW, confH);
    
    CGFloat btnX = confX;
    CGFloat btnY = CGRectGetMaxY(self.confirmBtn.frame);
    CGFloat btnW = SCREENWIDTH;
    CGFloat btnH = 30;
    self.receiveBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    
    CGFloat scrollX = confX;
    CGFloat scrollY = CGRectGetMaxY(self.receiveBtn.frame);
    CGFloat scrollW = SCREENWIDTH;
    CGFloat scrollH = self.view.bounds.size.height - scrollY;
    self.scrollView.frame = CGRectMake(scrollX, scrollY, scrollW, scrollH);
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
    NSString *moneyTitle = [NSString stringWithFormat:@"悬赏金额%d",detailMsg.money];
    self.moneyLabel.text = moneyTitle;
    NSString *title = [NSString stringWithFormat:@"共收到%d封医生简历",self.detailMsg.all];
    [self.receiveBtn setTitle:title forState:UIControlStateNormal];
    
    NSString *contitle = [NSString stringWithFormat:@"已录取%d封医生简历",self.detailMsg.accept];
    [self.confirmBtn setTitle:contitle forState:UIControlStateNormal];
    self.scrollView.message = detailMsg;
}


@end
