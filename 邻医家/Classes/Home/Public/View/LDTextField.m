//
//  LDTextField.m
//  邻医家
//
//  Created by Daniel on 15/5/15.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "LDTextField.h"

@implementation LDTextField
- (void)setupTextFieldWithImage:(NSString *)image selImage:(NSString *)selImage delegate:(id<UITextFieldDelegate>)delegate
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 28, 20);
    button.imageEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0);
    button.adjustsImageWhenHighlighted = NO;
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selImage] forState:UIControlStateSelected];
    self.leftView = button;
    self.leftButton = button;
    self.leftViewMode = UITextFieldViewModeAlways;
    self.delegate = delegate;
}
- (void)setupRightViewWithTitle:(NSString *)title
{
    UILabel *rightView = [[UILabel alloc] init];
    rightView.userInteractionEnabled = YES;
    rightView.frame = CGRectMake(0, 0, 80, 30);
    rightView.backgroundColor = [UIColor redColor];
    rightView.font = [UIFont systemFontOfSize:13];
    rightView.textColor = [UIColor blackColor];
    rightView.text = title;
    rightView.textAlignment = NSTextAlignmentCenter;
    self.rightView = rightView;
    self.rightViewMode = UITextFieldViewModeAlways;
    
    [rightView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightViewTap:)]];
}
- (void)rightViewTap:(UITapGestureRecognizer *)recognizer
{
    NSLog(@"I am here");
}
@end
