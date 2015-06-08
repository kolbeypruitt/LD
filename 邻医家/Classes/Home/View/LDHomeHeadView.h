//
//  LDHomeHeadView.h
//  邻医家
//
//  Created by Daniel on 15/5/4.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "ARSegmentPageControllerHeaderProtocol.h"
@class LDHomeHeadView;

@protocol LDHomeHeaderViewDelegate <NSObject>
@optional
- (void)headerView:(LDHomeHeadView *)headerView didClickedBtn:(UIButton *)button;
@end

@interface LDHomeHeadView : UIImageView 
@property (nonatomic,weak) id<LDHomeHeaderViewDelegate> delegate;
@end
