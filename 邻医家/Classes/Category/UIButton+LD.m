//
//  UIButton+LD.m
//  邻医家
//
//  Created by Daniel on 15/5/13.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "UIButton+LD.h"
#import "UIImage+MJ.h"
@implementation UIButton (LD)
+ (UIButton *)setupBtnWithImage:(NSString *)image selectedImage:(NSString *)selImage target:(id)target action:(SEL)action
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
    [button addTarget:target action:action forControlEvents:UIControlEventTouchDown];
    
    return button;
}
+ (UIButton *)buttonWithTitle:(NSString *)title font:(int)fontSize titleColor:(UIColor *)color target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    button.titleLabel.backgroundColor = [UIColor clearColor];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}
@end
