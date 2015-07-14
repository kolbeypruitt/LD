//
//  LDInputView.h
//  邻医家
//
//  Created by Daniel on 15/7/14.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class LDInputMessage;
#import <UIKit/UIKit.h>

@interface LDInputView : UIImageView
@property (nonatomic,weak) UITextField *inputField;
@property (nonatomic,strong) LDInputMessage *inputMessage;
@end
