//
//  LDMessageHeader.m
//  邻医家
//
//  Created by Daniel on 15/7/15.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "EmployDetail.h"
#import "Common.h"
#import "PatienInviteDetail.h"
#import "LDMessageHeader.h"

@implementation LDMessageHeader
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = BGCOLOR;
        [self addCustomViews];
        [self layoutCustomViews];
    }
    return self;
}
- (void)setupButton:(UIButton *)button
{
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button setTitleColor:IWColor(88, 202, 203) forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor whiteColor]];
}
- (void)addCustomViews
{
    UIButton *acceptBtn = [[UIButton alloc] init];
    [self setupButton:acceptBtn];
    self.acceptBtn = acceptBtn;
    [self addSubview:acceptBtn];
    
    UIButton *allBtn = [[UIButton alloc] init];
    [self setupButton:allBtn];
    self.allBtn = allBtn;
    [self addSubview:allBtn];
}
- (void)layoutCustomViews
{
    CGFloat acceptX = 0;
    CGFloat acceptY = 8;
    CGFloat acceptW = SCREENWIDTH;
    CGFloat acceptH = 30;
    self.acceptBtn.frame = CGRectMake(acceptX, acceptY, acceptW, acceptH);
    
    CGFloat allX = acceptX;
    CGFloat allY = CGRectGetMaxY(self.acceptBtn.frame) + 8;
    CGFloat allW = acceptW;
    CGFloat allH = acceptH;
    self.allBtn.frame = CGRectMake(allX, allY, allW, allH);
}
- (void)setInviteDetail:(PatienInviteDetail *)inviteDetail
{
    _inviteDetail = inviteDetail;
    [self.acceptBtn setTitle:[NSString stringWithFormat:@"已录取%d封简历",self.inviteDetail.accept] forState:UIControlStateNormal];
    [self.allBtn setTitle:[NSString stringWithFormat:@"共收到%d封简历",self.inviteDetail.all] forState:UIControlStateNormal];
    
}
- (void)setEmpDetail:(EmployDetail *)empDetail
{
    _empDetail = empDetail;
    [self.acceptBtn setTitle:[NSString stringWithFormat:@"已录取%d封简历",self.empDetail.accept] forState:UIControlStateNormal];
    [self.allBtn setTitle:[NSString stringWithFormat:@"共收到%d封简历",self.empDetail.all] forState:UIControlStateNormal];
}
@end













