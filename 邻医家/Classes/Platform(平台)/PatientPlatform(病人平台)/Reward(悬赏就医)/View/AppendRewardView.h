//
//  AppendRewardView.h
//  邻医家
//
//  Created by Daniel on 15/6/18.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class AppendRewardView,AppendInviteParam;
#import <UIKit/UIKit.h>
@protocol AppendRewardDelegate <NSObject>
@optional
- (void)appendView:(AppendRewardView *)appendView commitedData:(AppendInviteParam *)dataParam;

@end
@interface AppendRewardView : UIView
/**
 *  1, 自由请医 2，悬赏请医
 */
@property (nonatomic,weak) id<AppendRewardDelegate> delegate;
@end
