//
//  LDInputController.h
//  邻医家
//
//  Created by Daniel on 15/7/14.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class LDCopyView;
#import <UIKit/UIKit.h>

@interface LDInputController : UIViewController
@property (nonatomic,weak) UIScrollView *scrollView;
@property (nonatomic,weak) UIButton *commitBtn;
@property (nonatomic,strong) NSArray *inputMessages;
@property (nonatomic,strong) NSMutableArray *commitMessages;
@property (nonatomic,weak) LDCopyView *uploadView;
@property (nonatomic,assign) BOOL showUpView;
@property (nonatomic,strong) NSMutableArray *inputViews;
- (BOOL)messageComplete;
- (void)commitBtnClicked;
- (void)addCustomViews;
- (void)layoutCustomViews;
@end
