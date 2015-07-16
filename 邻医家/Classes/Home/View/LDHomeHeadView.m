//
//  LDHomeHeadView.m
//  邻医家
//
//  Created by Daniel on 15/5/4.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#define DIVIDERWIDTH 2
#import "IWCommon.h"
#import "UIImage+MJ.h"
#import "LDHomeHeadView.h"
#import "LDHomeButton.h"
@interface LDHomeHeadView ()
@property (nonatomic,weak) UIImageView *topImageView;
/**
 *  多点执业
 */
@property (nonatomic,weak) LDHomeButton *multiJobBtn;
/**
 *  博士流动站
 */
@property (nonatomic,weak) LDHomeButton *doctorFlowBtn;
/**
 *  相关招聘信息
 */
@property (nonatomic,weak) LDHomeButton *recruitMsgBtn;

@end
@implementation LDHomeHeadView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor clearColor];
        self.clipsToBounds = YES;
        
        UIImageView *topImageView = [[UIImageView alloc] init];
        topImageView.backgroundColor = [UIColor redColor];
        topImageView.image = [UIImage imageWithName:@"banner1"];
        [self addSubview:topImageView];
        self.topImageView = topImageView;
        
        LDHomeButton *multiJobBtn = [LDHomeButton homeButtonWithImage:@"nav1" title:@"多点执业政策" target:self action:@selector(buttonClicked:)];
        [multiJobBtn setBackgroundColor:IWColor(175, 203, 115)];
        multiJobBtn.tag = 3;
        [self addSubview:multiJobBtn];
        self.multiJobBtn = multiJobBtn;
        
        LDHomeButton *doctorFlowBtn = [LDHomeButton homeButtonWithImage:@"nav2" title:@"博士后站点" target:self action:@selector(buttonClicked:)];
        [doctorFlowBtn setBackgroundColor:IWColor(245, 177, 68)];
        doctorFlowBtn.tag = 4;
        [self addSubview:doctorFlowBtn];
        self.doctorFlowBtn = doctorFlowBtn;
        
        LDHomeButton *recruitMsgBtn = [LDHomeButton homeButtonWithImage:@"nav3" title:@"相关招聘信息" target:self action:@selector(buttonClicked:)];
        [recruitMsgBtn setBackgroundColor:IWColor(255, 116, 132)];
        [self addSubview:recruitMsgBtn];
        recruitMsgBtn.tag = 5;
        self.recruitMsgBtn = recruitMsgBtn;
        
    }
    
    return self;
}
- (void)buttonClicked:(LDHomeButton *)button
{
    if ([self.delegate respondsToSelector:@selector(headerView:didClickedBtn:)]) {
        [self.delegate headerView:self didClickedBtn:button];
    }
}


- (void)layoutSubviews
{
    static const CGFloat padding = 10;
    [super layoutSubviews];
    CGFloat topImageX = 0;
    CGFloat topImageY = 64;
    CGFloat topImageWidth = self.frame.size.width;
    CGFloat topImageHeight = 100;
    self.topImageView.frame = CGRectMake(topImageX, topImageY, topImageWidth, topImageHeight);
    
    CGFloat multiJobX = padding;
    CGFloat multiJobY = CGRectGetMaxY(self.topImageView.frame) + padding/2;
    CGFloat multiJobWidth = (topImageWidth - 4 * padding) / 3;
    CGFloat multiJobHeight = 110;
    self.multiJobBtn.frame = CGRectMake(multiJobX, multiJobY, multiJobWidth, multiJobHeight);
    
  
    
    CGFloat docFlowX = CGRectGetMaxX(self.multiJobBtn.frame) + padding;
    CGFloat docFlowY = multiJobY;
    CGFloat docFlowWidth = multiJobWidth;
    CGFloat docFlowHeight = multiJobHeight;
    self.doctorFlowBtn.frame = CGRectMake(docFlowX, docFlowY, docFlowWidth, docFlowHeight);
    


    CGFloat recuitX = CGRectGetMaxX(self.doctorFlowBtn.frame) + padding;
    CGFloat recuitY = docFlowY;
    CGFloat recuitWidth = docFlowWidth;
    CGFloat recuitHeight = docFlowHeight;
    self.recruitMsgBtn.frame = CGRectMake(recuitX, recuitY, recuitWidth, recuitHeight);
    

   
    
    CGRect frame = self.frame;
    frame.size.height = CGRectGetMaxY(self.recruitMsgBtn.frame);
    self.frame = frame;
}
@end



















