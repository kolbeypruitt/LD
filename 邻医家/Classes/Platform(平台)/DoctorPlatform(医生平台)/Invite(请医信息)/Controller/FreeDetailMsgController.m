//
//  FreeDetailMsgController.m
//  邻医家
//
//  Created by Daniel on 15/6/14.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "MBProgressHUD+MJ.h"
#import "ReplyInviteTool.h"
#import "BaseResult.h"
#import "FreeDetailMsgController.h"
#import "FreeMsgResult.h"
#import "FreeDetailMsgParam.h"
#import "FreeDetailMsgTool.h"
#import "InviteDocMessage.h"
#import "InviteDocDetail.h"
#import "InviteDetailView.h"
@interface FreeDetailMsgController () <InviteDetailViewDelegate>
@property (nonatomic,strong) InviteDocDetail *detailMsg;
@property (nonatomic,weak) InviteDetailView *detailView;
@end

@implementation FreeDetailMsgController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self loadData];
    [self addCustomViews];
}
- (void)setup
{
    self.title = @"请医详情";
    self.navigationItem.rightBarButtonItem = nil;
}
- (void)addCustomViews
{
    InviteDetailView *detailView = [[InviteDetailView alloc] initWithFrame:self.view.bounds];
    detailView.inviteDelegate = self;
    detailView.contentSize = CGSizeMake(0, self.view.frame.size.height * 1.1);
    self.detailView = detailView;
    [self.view addSubview:detailView];
}
- (void)loadData
{
    FreeDetailMsgParam *param = [FreeDetailMsgParam paramWithId:self.message.id];
    [FreeDetailMsgTool getSDInfoWithParam:param success:^(FreeMsgResult *result) {
        self.detailMsg = result.seekDoctor;
        self.detailView.detailMsg = self.detailMsg;
    } failure:^(NSError *error) {
        
    }];
}
- (void)inviteDetailView:(InviteDetailView *)detailView clickedBtn:(UIButton *)btn
{
    FreeDetailMsgParam *param = [FreeDetailMsgParam paramWithId:self.message.id];
    [ReplyInviteTool replyInviteMsgWithParam:param success:^(BaseResult *result) {
        if ([result.status isEqualToString:@"S"]) {
            [self.navigationController popViewControllerAnimated:YES];
        }else
        {
            [MBProgressHUD showError:@"失败"];
        }
    } failure:^(NSError *error) {
        
    }];
}

@end
