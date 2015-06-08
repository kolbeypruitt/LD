//
//  LDTextField.h
//  邻医家
//
//  Created by Daniel on 15/5/15.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import <UIKit/UIKit.h>


@interface LDTextField : UITextField
@property (nonatomic,weak) UIButton *leftButton;
- (void)setupTextFieldWithImage:(NSString *)image selImage:(NSString *)selImage delegate:(id<UITextFieldDelegate>)delegate;
- (void)setupRightViewWithTitle:(NSString *)title;
@end
