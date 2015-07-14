//
//  LDInputController.h
//  邻医家
//
//  Created by Daniel on 15/7/14.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface LDInputController : UIViewController
@property (nonatomic,strong) NSArray *inputMessages;
@property (nonatomic,strong) NSMutableArray *commitMessages;
- (BOOL)messageComplete;
- (void)commitBtnClicked;
@end
