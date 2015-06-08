//
//  LDHomeHeadView.m
//  邻医家
//
//  Created by Daniel on 15/5/4.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#define DIVIDERWIDTH 2
#import "UIImage+MJ.h"
#import "LDHomeHeadView.h"
@interface LDHomeHeadView ()
@property (nonatomic,weak) UIImageView *topImageView;
/**
 *  多点执业
 */
@property (nonatomic,weak) UIButton *multiJobBtn;
/**
 *  博士流动站
 */
@property (nonatomic,weak) UIButton *doctorFlowBtn;
/**
 *  相关招聘信息
 */
@property (nonatomic,weak) UIButton *recruitMsgBtn;

@property (nonatomic,weak) UIImageView *horizontalDivider1;
@property (nonatomic,weak) UIImageView *verticalDivider1;
@property (nonatomic,weak) UIImageView *verticalDivider2;
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
        topImageView.image = [UIImage imageWithName:@"test_1"];
        [self addSubview:topImageView];
        self.topImageView = topImageView;
        
        UIButton *multiJobBtn = [self setupBtnWithImage:nil selectedImage:nil target:self action:@selector(buttonClicked:)];
        multiJobBtn.tag = 3;
        [multiJobBtn setTitle:@"多点\n执业政策" forState:UIControlStateNormal];
        self.multiJobBtn = multiJobBtn;
        
        UIButton *doctorFlowBtn = [self setupBtnWithImage:nil selectedImage:nil target:self action:@selector(buttonClicked:)];
        doctorFlowBtn.tag = 4;
        [doctorFlowBtn setTitle:@"博士\n流动站" forState:UIControlStateNormal];
        self.doctorFlowBtn = doctorFlowBtn;
        
        UIButton *recruitMsgBtn = [self setupBtnWithImage:nil selectedImage:nil target:self action:@selector(buttonClicked:)];
        recruitMsgBtn.tag = 5;
        [recruitMsgBtn setTitle:@"相关\n招聘信息" forState:UIControlStateNormal];
        self.recruitMsgBtn = recruitMsgBtn;
        
        
        self.horizontalDivider1 = [self setupDivider];
                                                                   
        
        self.verticalDivider1 = [self setupDivider];
        
        self.verticalDivider2 = [self setupDivider];
        
    }
    
    return self;
}
- (void)buttonClicked:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(headerView:didClickedBtn:)]) {
        [self.delegate headerView:self didClickedBtn:button];
    }
}
- (UIImageView *)setupDivider
{
    UIImageView *divider = [[UIImageView alloc] init];
    divider.backgroundColor = [UIColor grayColor];
    [self addSubview:divider];
    return divider;
}
- (UIButton *)setupBtnWithImage:(NSString *)image selectedImage:(NSString *)selImage target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    button.backgroundColor = [UIColor whiteColor];
    
    button.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    button.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    button.titleLabel.backgroundColor = [UIColor clearColor];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
   
    [button setImage:[UIImage imageWithName:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageWithName:selImage] forState:UIControlStateSelected];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    
    return button;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat topImageX = 0;
    CGFloat topImageY = 64;
    CGFloat topImageWidth = self.frame.size.width;
    CGFloat topImageHeight = 100;
    self.topImageView.frame = CGRectMake(topImageX, topImageY, topImageWidth, topImageHeight);
    
    CGFloat multiJobX = 0;
    CGFloat multiJobY = CGRectGetMaxY(self.topImageView.frame);
    CGFloat multiJobWidth = (topImageWidth - 2 * DIVIDERWIDTH) / 3;
    CGFloat multiJobHeight = 80;
    self.multiJobBtn.frame = CGRectMake(multiJobX, multiJobY, multiJobWidth, multiJobHeight);
    
    CGFloat vertical1X = CGRectGetMaxX(self.multiJobBtn.frame);
    CGFloat vertical1Y = multiJobY;
    CGFloat vertical1Width = DIVIDERWIDTH;
    CGFloat vertical1Height = multiJobHeight;
    self.verticalDivider1.frame = CGRectMake(vertical1X, vertical1Y, vertical1Width, vertical1Height);
    
    CGFloat docFlowX = CGRectGetMaxX(self.verticalDivider1.frame);
    CGFloat docFlowY = multiJobY;
    CGFloat docFlowWidth = multiJobWidth;
    CGFloat docFlowHeight = multiJobHeight;
    self.doctorFlowBtn.frame = CGRectMake(docFlowX, docFlowY, docFlowWidth, docFlowHeight);
    
    CGFloat vertical2X = CGRectGetMaxX(self.doctorFlowBtn.frame);
    CGFloat vertical2Y = docFlowY;
    CGFloat vertical2Height = docFlowHeight;
    CGFloat vertical2Width = DIVIDERWIDTH;
    self.verticalDivider2.frame = CGRectMake(vertical2X, vertical2Y, vertical2Width, vertical2Height);

    CGFloat recuitX = CGRectGetMaxX(self.verticalDivider2.frame);
    CGFloat recuitY = docFlowY;
    CGFloat recuitWidth = docFlowWidth;
    CGFloat recuitHeight = docFlowHeight;
    self.recruitMsgBtn.frame = CGRectMake(recuitX, recuitY, recuitWidth, recuitHeight);
    
//    CGFloat horizontal1X = 0;
//    CGFloat horizontal1Y = CGRectGetMaxY(self.recruitMsgBtn.frame);
//    CGFloat horizontal1Widht = self.frame.size.width;
//    CGFloat horizontal1Height = 2;
//    self.horizontalDivider1.frame = CGRectMake(horizontal1X, horizontal1Y, horizontal1Widht, horizontal1Height);
   
    
    CGRect frame = self.frame;
    frame.size.height = CGRectGetMaxY(self.recruitMsgBtn.frame);
    self.frame = frame;
}
@end



















