//
//  DoctorPlatformButton.m
//  邻医家
//
//  Created by Daniel on 15/7/12.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#define IMAGERATIO 0.4
#define IMAGEWH 40
#import "IWCommon.h"
#import "LDPlatformButton.h"
#import "UIImage+MJ.h"
@implementation LDPlatformButton
+ (instancetype)platformBtnWithImage:(NSString *)image title:(NSString *)title target:(id)target action:(SEL)action
{
    LDPlatformButton *button = [[LDPlatformButton alloc] init];
    button.layer.cornerRadius = 10;
    button.clipsToBounds = YES;
    button.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:[UIImage imageWithName:image] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = IMAGEWH;
    CGFloat imageH = IMAGEWH;
    CGFloat imageX =(contentRect.size.width * IMAGERATIO) - (IMAGEWH + 10);
    CGFloat imageY = contentRect.size.height/2 - imageH/2;
    return CGRectMake(imageX, imageY, imageW, imageH);
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = contentRect.size.width * IMAGERATIO;
    CGFloat titleY = 0;
    CGFloat titleW = contentRect.size.width - titleX;
    CGFloat titleH = contentRect.size.height;
    return CGRectMake(titleX, titleY, titleW, titleH);
}
- (void)setHighlighted:(BOOL)highlighted
{
    
}
@end
