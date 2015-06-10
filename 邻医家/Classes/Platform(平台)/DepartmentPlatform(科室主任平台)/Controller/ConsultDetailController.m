//
//  RecruitDetailController.m
//  邻医家
//
//  Created by Daniel on 15/6/4.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#define COUNT 11
#import "ConsultMessage.h"
#import "ConsultDetailTool.h"
#import "ConsultDetailParam.h"
#import "ConsultDetailResult.h"
#import "AllResumeViewController.h"
#import "ConfirmedResumeController.h"
#import "ConsultDetailController.h"
#import "ResumeMessageView.h"
#import "Common.h"
#import "RecruitMessageView.h"
@interface ConsultDetailController ()<ResumeMessageViewDelegate>
@property (nonatomic,weak) ResumeMessageView *resumeView;
@property (nonatomic,weak) RecruitMessageView  *messageView;
@property (nonatomic,strong) ConsultDetailResult *result;
@end

@implementation ConsultDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self setup];
    [self addCustomViews];
    [self layoutCustomViews];
}
- (void)loadData
{
    ConsultDetailParam *param = [ConsultDetailParam paramWithId:self.consultMessage.id];
    [ConsultDetailTool consultDetailWithParam:param success:^(ConsultDetailResult *result) {
        self.result = result;
    } failure:^(NSError *error) {
        
    }];
}
- (void)setResult:(ConsultDetailResult *)result
{
    _result = result;
    self.resumeView.result = result;
}
- (void)setup
{
    self.title = @"招聘详情";
    self.view.backgroundColor  = IWColor(226, 226, 226);
}
- (void)addCustomViews
{
    //resumeView
    ResumeMessageView *resumeView = [[ResumeMessageView alloc] init];
    resumeView.delegate = self;
    [self.view addSubview:resumeView];
    self.resumeView = resumeView;
   //messageView
    RecruitMessageView *messageView = [[RecruitMessageView alloc] init];
    [self.view addSubview:messageView];
    self.messageView = messageView;
}
- (void)layoutCustomViews;
{
    self.resumeView.frame = CGRectMake(0, 74, SCREENWIDTH, 80);
    
    CGFloat scrollX = 0;
    CGFloat scrollY = CGRectGetMaxY(self.resumeView.frame);
    CGFloat scrollW = SCREENWIDTH;
    CGFloat scrollH = SCREENHEIGHT - scrollY;
    self.messageView.frame = CGRectMake(scrollX, scrollY, scrollW, scrollH);
}
#pragma mark - ResumeViewDelegate
- (void)resumeMessageView:(ResumeMessageView *)messageViw clickedBtn:(UIButton *)senderBtn
{
    switch (senderBtn.tag) {
        case 1:
        {
            AllResumeViewController *allVc =  [[AllResumeViewController alloc] init];
            [self.navigationController pushViewController:allVc animated:YES];
            break;
        }
        case 2:
        {
            ConfirmedResumeController *confirmedVc = [[ConfirmedResumeController alloc] init];
            [self.navigationController pushViewController:confirmedVc animated:YES];
            break;
        }
        default:
            break;
    }
}
@end











