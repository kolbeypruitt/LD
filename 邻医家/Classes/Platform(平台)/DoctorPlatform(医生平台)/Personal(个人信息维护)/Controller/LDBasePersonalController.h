//
//  LDPersonalController.h
//  邻医家
//
//  Created by Daniel on 15/7/22.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class LDArrangement;
#import <UIKit/UIKit.h>

@interface LDBasePersonalController : UIViewController
@property (nonatomic,strong) NSMutableArray *checkViews;
@property (nonatomic,strong) LDArrangement *arrangement;
- (BOOL)messageComplete;
@end
