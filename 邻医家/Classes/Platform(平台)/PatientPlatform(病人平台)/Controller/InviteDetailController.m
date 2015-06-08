//
//  InviteDetailController.m
//  邻医家
//
//  Created by Daniel on 15/6/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "AllResumeViewController.h"
#import "InviteDetailController.h"
#import "InviteDoctorView.h"
#import "Common.h"
#import "UIBarButtonItem+ENTER.h"
#import "IWCommon.h"
#import "UIButton+LD.h"
@interface InviteDetailController ()<UIScrollViewDelegate>
@property (nonatomic,weak) UIButton  *receiveBtn;
@property (nonatomic,weak) InviteDoctorView *scrollView;
@property (nonatomic,strong) NSMutableArray *labels;
@property (nonatomic,strong) NSMutableArray *contentLabels;
@property (nonatomic,strong) NSMutableArray *lines;
@end

@implementation InviteDetailController
- (NSMutableArray *)labels
{
    if (_labels == nil) {
        _labels = [NSMutableArray array];
    }
    return _labels;
}
- (NSMutableArray *)contentLabels
{
    if (_contentLabels == nil) {
        _contentLabels = [NSMutableArray array];
    }
    return _contentLabels;
}
- (NSMutableArray *)lines
{
    if (_lines == nil) {
        _lines = [NSMutableArray array];
    }
    return _lines;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.title = @"请医详情";
    self.view.backgroundColor = IWColor(226, 226, 226);
    [self setNav];
    [self addCustomViews];
    [self layoutCustomViews];
}
- (void)addCustomViews
{
    UIButton *receiveBtn = [UIButton buttonWithTitle:@"一共收到5位医生的响应"
                                                font:14
                                          titleColor:[UIColor whiteColor]
                                              target:self
                                              action:@selector(receiveBtnClicked)];
    [self.view addSubview:receiveBtn];
    self.receiveBtn = receiveBtn;
    self.receiveBtn.backgroundColor = [UIColor purpleColor];
    
    InviteDoctorView *scrollView = [[InviteDoctorView alloc] init];
    self.scrollView = scrollView;
    [self.view addSubview:scrollView];
}
- (void)receiveBtnClicked
{
    AllResumeViewController *allVC = [[AllResumeViewController alloc] init];
    [self.navigationController pushViewController:allVC animated:YES];
}
- (void)layoutCustomViews
{
    CGFloat btnX = 0;
    CGFloat btnY = 64;
    CGFloat btnW = SCREENWIDTH;
    CGFloat btnH = 60;
    self.receiveBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    
    CGFloat scrollX = 0;
    CGFloat scrollY = CGRectGetMaxY(self.receiveBtn.frame);
    CGFloat scrollW = SCREENWIDTH;
    CGFloat scrollH = self.view.bounds.size.height - scrollY;
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
    
}
@end
