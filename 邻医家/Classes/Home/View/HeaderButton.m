//
//  HeaderButton.m
//  邻医家
//
//  Created by Daniel on 15/4/29.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#define IMAGERATIO 0.6
#import "HeaderButton.h"

@implementation HeaderButton
+ (HeaderButton *)headerButton
{
    return [[self alloc] init];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.adjustsImageWhenHighlighted = NO;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.imageView.contentMode = UIViewContentModeCenter;
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageWidth = contentRect.size.width;
    CGFloat imageHeight = contentRect.size.height * IMAGERATIO;
    return CGRectMake(imageX, imageY, imageWidth,imageHeight);
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY = contentRect.size.height * IMAGERATIO;
    CGFloat titleWidth = contentRect.size.width;
    CGFloat titleHeight = contentRect.size.height - contentRect.size.height * IMAGERATIO;
    return CGRectMake(titleX, titleY, titleWidth, titleHeight);
}
@end
















