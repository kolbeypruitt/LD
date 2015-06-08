//
//  UIBarButtonItem+MJ.m
//  ItcastWeibo
//
//  Created by apple on 14-5-6.
//  Copyright (c) 2014年 itcast. All rights reserved.
//
#import "UIImage+MJ.h"
#import "UIBarButtonItem+MJ.h"
@implementation UIBarButtonItem (MJ)
+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageWithName:icon] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageWithName:highIcon] forState:UIControlStateHighlighted];
    button.frame = (CGRect){CGPointZero, button.currentBackgroundImage.size};
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}
+ (UIBarButtonItem *)itemwithImage:(NSString *)image title:(NSString *)title target:(id)target action:(SEL)action
{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 20, 24, 24);
    [backButton setTitle:title forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [backButton setBackgroundImage:[UIImage resizedImageWithName:@"navigationbar_button_left_background"] forState:UIControlStateNormal];
//    [backButton setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageWithName:@"navigationbar_button_left_background"]]];
    backButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [backButton setImage:[UIImage imageWithName:image ] forState:UIControlStateNormal];
    [backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:backButton];
}
+ (UIBarButtonItem *)itemwithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(0, 0, 50, 24);
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.titleLabel.textColor = [UIColor blackColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.backgroundColor = [UIColor clearColor];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}
@end
