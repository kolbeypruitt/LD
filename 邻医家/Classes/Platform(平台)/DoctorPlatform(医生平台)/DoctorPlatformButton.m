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
#import "DoctorPlatformButton.h"
#import "UIImage+MJ.h"
@implementation DoctorPlatformButton
+ (instancetype)doctorPlatformBtnWithImage:(NSString *)image title:(NSString *)title target:(id)target action:(SEL)action
{
    DoctorPlatformButton *button = [[DoctorPlatformButton alloc] init];
    button.imageView.contentMode = UIViewContentModeCenter;
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:[UIImage imageWithName:image] forState:UIControlStateNormal];
    [button setBackgroundColor:IWColor(88, 202, 203)];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        self.layer.cornerRadius = 10;
        self.clipsToBounds = YES;
        self.imageView.contentMode = UIViewContentModeCenter;
        [self setBackgroundColor:IWColor(88, 202, 203)];
    }
    return self;
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageW = 50;
    CGFloat imageH = 50;
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
