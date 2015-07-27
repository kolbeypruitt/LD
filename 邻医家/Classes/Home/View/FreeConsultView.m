//
//  freeConsultView.m
//  邻医家
//
//  Created by Daniel on 15/4/29.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#define LEFTBORDER 20
#define MARGIN 10
#import "IWCommon.h"
#import "UIImage+MJ.h"
#import "FreeConsultView.h"
#import "HomeHeaderView.h"
@interface FreeConsultView ()
@property (nonatomic,weak) UIImageView *iconView;
@property (nonatomic,weak) UILabel *freeconsultLabel;
@property (nonatomic,weak) UILabel *detailLabel;
@property (nonatomic,weak) HomeHeaderView *homeHeaderView;
@property (nonatomic,weak) UIImageView *border;
@end
@implementation FreeConsultView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.image = [UIImage resizedImageWithName:@"background_white_04"];
        self.highlightedImage = [UIImage imageWithName:@""];
        
        UIImageView *iconView = [[UIImageView alloc] init];
        [self addSubview:iconView];
        self.iconView = iconView;
        
        UILabel *freeconsultLabel = [[UILabel alloc] init];
        freeconsultLabel.font = [UIFont boldSystemFontOfSize:16];
        freeconsultLabel.textColor = [UIColor blackColor];
        freeconsultLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:freeconsultLabel];
        self.freeconsultLabel = freeconsultLabel;
        
        UILabel *detailLabel = [[UILabel alloc] init];
        detailLabel.font = [UIFont systemFontOfSize:13];
        detailLabel.textColor = [UIColor grayColor];
        detailLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:detailLabel];
        self.detailLabel = detailLabel;
        
        HomeHeaderView *headerView = [[HomeHeaderView alloc] init];
        [self addSubview:headerView];
        self.homeHeaderView = headerView;
        
        UIImageView *border = [[UIImageView alloc] init];
        border.backgroundColor = IWColor(226, 226, 226);
        [self addSubview:border];
        self.border = border;
        
        [self setSubViewsData];
        [self setupGesture];
        
    }
    return self;
}
- (void)setSubViewsData
{
    self.iconView.image = [UIImage imageWithName:@"免费咨询"];
    
    self.freeconsultLabel.text = @"免费咨询";
    
    self.detailLabel.text = @"获得专业建议，就诊前沟通";
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat iconX = LEFTBORDER;
    CGFloat iconY = MARGIN;
    CGFloat iconWidth = 55;
    CGFloat iconHeight = 55;
    self.iconView.frame = CGRectMake(iconX, iconY, iconWidth, iconHeight);
    
    CGFloat freeX = CGRectGetMaxX(self.iconView.frame) + MARGIN;
    CGFloat freeY = iconY;
    CGFloat freeWidth = self.frame.size.width - freeX;
    CGFloat freeHeight = 20;
    self.freeconsultLabel.frame = CGRectMake(freeX, freeY, freeWidth, freeHeight);
    
    CGFloat detailX = freeX;
    CGFloat detailY = CGRectGetMaxY(self.freeconsultLabel.frame) + MARGIN;
    CGFloat detailWidth = freeWidth;
    CGFloat detailHeight = freeHeight;
    self.detailLabel.frame = CGRectMake(detailX, detailY, detailWidth, detailHeight);
    
    CGFloat borderX = 0;
    CGFloat borderY = CGRectGetMaxY(self.detailLabel.frame) + 8;
    CGFloat borderWidth = self.frame.size.width;
    CGFloat borderHeight = 20;
    self.border.frame = CGRectMake(borderX, borderY, borderWidth, borderHeight);
    
    CGFloat headerX = 0;
    CGFloat headerY = CGRectGetMaxY(self.border.frame);
    CGFloat headerWidth = borderWidth;
    CGFloat headerHeight = 90;
    self.homeHeaderView.frame = CGRectMake(headerX, headerY, headerWidth, headerHeight);
    
    CGRect frame = self.frame;
    frame.size.height = CGRectGetMaxY(self.homeHeaderView.frame);
    self.frame = frame;
    
}
- (void)setupGesture
{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respondToTap:)];
    tapGesture.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tapGesture];
}
- (void)respondToTap:(UITapGestureRecognizer *)recognizer
{
//    NSLog(@"I am freeConsultView");
    if ([self.delegate respondsToSelector:@selector(didClickedFreeConsultView:)]) {
        [self.delegate didClickedFreeConsultView:self];
    }
}
@end




















