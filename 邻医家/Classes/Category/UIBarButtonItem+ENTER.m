//
//  UIBarButtonItem+ENTER.m
//  邻医家
//
//  Created by Daniel on 15/5/21.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "UIBarButtonItem+ENTER.h"

@implementation UIBarButtonItem (ENTER)
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title
{
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(0, 0, 60, 24);
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.titleLabel.textColor = [UIColor blackColor];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.backgroundColor = [UIColor clearColor];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}
@end
