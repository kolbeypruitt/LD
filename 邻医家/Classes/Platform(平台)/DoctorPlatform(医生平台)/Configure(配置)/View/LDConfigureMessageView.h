//
//  LDConfigureMessageView.h
//  邻医家
//
//  Created by Daniel on 15/7/24.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class LDCheckBox;
#import <UIKit/UIKit.h>

@interface LDConfigureMessageView : UIView
@property (weak, nonatomic) IBOutlet LDCheckBox *checkBox;
@property (weak, nonatomic) IBOutlet UILabel *configureLabel;

@end
