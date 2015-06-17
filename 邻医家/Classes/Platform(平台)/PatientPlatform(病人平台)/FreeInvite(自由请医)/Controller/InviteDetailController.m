//
//  InviteDetailController.m
//  邻医家
//
//  Created by Daniel on 15/6/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "AllInviteParam.h"
#import "BaseResult.h"
#import "MBProgressHUD+MJ.h"
#import "WithDrawDocTool.h"
#import "AcceptedDocController.h"
#import "FreeInviteDeResult.h"
#import "PatienAllDocController.h"
#import "InviteDocMessage.h"
#import "FreeDetailMsgParam.h"
#import "InviteDetailController.h"
#import "PatientInviteDetailTool.h"
#import "InviteDoctorView.h"
#import "Common.h"
#import "UIBarButtonItem+ENTER.h"
#import "IWCommon.h"
#import "UIButton+LD.h"
#import "PatienInviteDetail.h"
@interface InviteDetailController ()<UIScrollViewDelegate>
@property (nonatomic,weak) UIButton  *receiveBtn;
@property (nonatomic,weak) UIButton *confirmBtn;
@property (nonatomic,weak) InviteDoctorView *scrollView;
@property (nonatomic,strong) PatienInviteDetail *detailMsg;
@end
@implementation InviteDetailController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self loadData];
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
    NSString *title = [NSString stringWithFormat:@"共收到%d封医生简历",self.detailMsg.all];
    [self.receiveBtn setTitle:title forState:UIControlStateNormal];
    
    NSString *contitle = [NSString stringWithFormat:@"已录取%d封医生简历",self.detailMsg.accept];
    [self.confirmBtn setTitle:contitle forState:UIControlStateNormal];
    self.scrollView.message = detailMsg;
}

- (void)setup
{
    self.title = @"自由请医详情";
    self.view.backgroundColor = IWColor(226, 226, 226);
    [self setNav];
    [self addCustomViews];
    [self layoutCustomViews];
}
- (void)addCustomViews
{
    UIButton *receiveBtn = [UIButton buttonWithTitle:nil
                                                font:14
                                          titleColor:[UIColor whiteColor]
                                              target:self
                                              action:@selector(receiveBtnClicked)];
    [self.view addSubview:receiveBtn];
    self.receiveBtn = receiveBtn;
    self.receiveBtn.backgroundColor = [UIColor purpleColor];
    
    UIButton *confirmedBtn = [UIButton buttonWithTitle:nil
                                                  font:14
                                            titleColor:[UIColor whiteColor]
                                                target:self
                                                action:@selector(confirmBtnClicked:)];
    self.confirmBtn = confirmedBtn;
    [self.view addSubview:confirmedBtn];
    self.confirmBtn.backgroundColor = [UIColor orangeColor];
    
    InviteDoctorView *scrollView = [[InviteDoctorView alloc] init];
    scrollView.contentSize = CGSizeMake(SCREENWIDTH, SCREENHEIGHT);
    scrollView.contentInset = UIEdgeInsetsMake(0, 0, 60, 0);
    self.scrollView = scrollView;
    [self.view addSubview:scrollView];
}
- (void)confirmBtnClicked:(UIButton *)button
{
    AcceptedDocController *accept = [[AcceptedDocController alloc] init];
    accept.detailMsg = self.detailMsg;
    [self.navigationController pushViewController:accept animated:YES];
}
- (void)receiveBtnClicked
{
    PatienAllDocController *allVC = [[PatienAllDocController alloc] init];
    allVC.detailMsg = self.detailMsg;
    [self.navigationController pushViewController:allVC animated:YES];
}
- (void)layoutCustomViews
{
    CGFloat confX = 0;
    CGFloat confY = 64;
    CGFloat confW = SCREENWIDTH;
    CGFloat confH = 50;
    self.confirmBtn.frame = CGRectMake(confX, confY, confW, confH);
    
    CGFloat btnX = 0;
    CGFloat btnY = CGRectGetMaxY(self.confirmBtn.frame);
    CGFloat btnW = SCREENWIDTH;
    CGFloat btnH = 60;
    self.receiveBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    
    CGFloat scrollX = 0;
    CGFloat scrollY = CGRectGetMaxY(self.receiveBtn.frame);
    CGFloat scrollW = SCREENWIDTH;
    CGFloat scrollH = self.view.bounds.size.height - scrollY - 50;
    self.scrollView.frame = CGRectMake(scrollX, scrollY, scrollW, scrollH);
    
}
- (void)setNav
{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self
                                                                      action:@selector(retreat)
                                                                       title:@"撤销"];
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
    [[NSNotificationCenter defaultCenter] postNotificationName:PATIENTWITHDRAWSUCCESSNOTIFICATION object:self];
}
@end
