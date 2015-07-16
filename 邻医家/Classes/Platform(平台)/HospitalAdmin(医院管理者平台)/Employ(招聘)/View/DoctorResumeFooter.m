//
//  DoctorResumeFooter.m
//  邻医家
//
//  Created by Daniel on 15/7/16.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "IWCommon.h"
#import "DoctorResumeFooter.h"
@interface DoctorResumeFooter ()
@property (nonatomic,weak) UIView *borderView;
@end
@implementation DoctorResumeFooter

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addCustomViews];
    }
    return self;
}
- (void)addCustomViews
{
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundColor:IWColor(88, 202, 203)];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:@"邀请此医生" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:button];
    self.inviteBtn = button;
    
    UIView *borderView = [[UIView alloc] init];
    borderView.backgroundColor = [UIColor whiteColor];
    [self addSubview:borderView];
    self.borderView = borderView;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat borderX = 0;
    CGFloat borderY = 0;
    CGFloat borderW = self.bounds.size.width;
    CGFloat borderH = 10;
    self.borderView.frame = CGRectMake(borderX, borderY, borderW, borderH);
    
    CGFloat btnX = borderX;
    CGFloat btnY = CGRectGetMaxY(self.borderView.frame);
    CGFloat btnW = borderW;
    CGFloat btnH = 40;
    self.inviteBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);
}
@end
