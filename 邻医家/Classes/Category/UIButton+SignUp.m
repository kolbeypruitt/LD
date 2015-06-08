//
//  UIButton+SignUp.m
//  邻医家
//
//  Created by Daniel on 15/5/15.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "UIButton+SignUp.h"

@implementation UIButton (SignUp)
+ (UIButton *)butttonWithImage:(NSString *)image selectedImage:(NSString *)selImage
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selImage] forState:UIControlStateSelected];
    button.frame = CGRectMake(0, 0, 20, 20);
    return button;
}
@end
