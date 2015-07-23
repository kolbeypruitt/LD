//
//  LDAssignmentView.h
//  邻医家
//
//  Created by Daniel on 15/7/23.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class LDArrangement;
#import <UIKit/UIKit.h>

@interface LDAssignmentView : UIView
@property (nonatomic,strong) LDArrangement *arrangement;
@property (nonatomic,strong) NSMutableArray *checkViews;
@end
