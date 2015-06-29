//
//  HotDepmentView.h
//  邻医家
//
//  Created by Daniel on 15/6/23.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class HotDepmentView;
#import <UIKit/UIKit.h>
@protocol HotDepmentViewDelegate <NSObject>

@optional
- (void)hotDepmentView:(HotDepmentView *)depview clickedBtn:(UIButton *)button;

@end

@interface HotDepmentView : UIImageView
@property (nonatomic,weak) id<HotDepmentViewDelegate> delegate;
@end
