//
//  InviteDetailView.h
//  邻医家
//
//  Created by Daniel on 15/6/14.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class InviteDocDetail,InviteDetailView;
#import <UIKit/UIKit.h>
@protocol InviteDetailViewDelegate <NSObject>

@optional
- (void)inviteDetailView:(InviteDetailView *)detailView clickedBtn:(UIButton *)btn;
@end
@interface InviteDetailView : UIScrollView
@property (nonatomic,strong) InviteDocDetail *detailMsg;
@property (nonatomic,weak) id<InviteDetailViewDelegate> inviteDelegate;
@end
