//
//  HotAreaView.h
//  邻医家
//
//  Created by Daniel on 15/6/23.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class HotAreaView;
#import <UIKit/UIKit.h>
@protocol HotAreaViewDelegate <NSObject>
@optional
- (void)hotAreaView:(HotAreaView *)areaView sender:(UIButton *)button;
@end

@interface HotAreaView : UIImageView
@property (nonatomic,weak) id<HotAreaViewDelegate> delegate;
@end
