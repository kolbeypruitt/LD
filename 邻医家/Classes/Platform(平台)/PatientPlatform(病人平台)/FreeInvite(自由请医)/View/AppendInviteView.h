//
//  AppendInviteView.h
//  邻医家
//
//  Created by Daniel on 15/6/18.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class AppendInviteView,AppendInviteParam;
#import <UIKit/UIKit.h>
@protocol ApppendInviteViewDelegate <NSObject>
@optional
- (void)appendView:(AppendInviteView *)appendView commitedData:(NSDictionary *)dataParam;

@end

@interface AppendInviteView : UIView
/**
 *  1, 自由请医 2，悬赏请医
 */
@property (nonatomic,weak) id<ApppendInviteViewDelegate> delegate;
@end
