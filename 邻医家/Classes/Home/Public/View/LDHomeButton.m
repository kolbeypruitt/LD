//
//  LDHomeButton.m
//  邻医家
//
//  Created by Daniel on 15/7/16.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#define IMAGERATIO 0.4
#define IMAGEWH 40
#import "LDHomeButton.h"
#import "UIImage+MJ.h"
#import "IWCommon.h"
@implementation LDHomeButton

+ (instancetype)homeButtonWithImage:(NSString *)image title:(NSString *)title target:(id)target action:(SEL)action  
{
    LDHomeButton *button = [[LDHomeButton alloc] init];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    button.titleLabel.font = [UIFont systemFontOfSize:15];
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
    CGFloat imageX = (contentRect.size.width)/2 - imageW/2;
    CGFloat imageY = 10;
    return CGRectMake(imageX, imageY, imageW, imageH);
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY = IMAGEWH + 10;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = 30;
    return CGRectMake(titleX, titleY, titleW, titleH);
}
- (void)setHighlighted:(BOOL)highlighted
{
    
}

@end
