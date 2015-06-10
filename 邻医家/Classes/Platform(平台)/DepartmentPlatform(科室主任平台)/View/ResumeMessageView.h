//
//  ResumeMessageView.h
//  邻医家
//
//  Created by Daniel on 15/6/4.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class ResumeMessageView,ConsultDetailResult;
#import <UIKit/UIKit.h>
@protocol ResumeMessageViewDelegate <NSObject>
@optional
- (void)resumeMessageView:(ResumeMessageView *)messageViw clickedBtn:(UIButton *)senderBtn;

@end

@interface ResumeMessageView : UIView
@property (nonatomic,weak) id<ResumeMessageViewDelegate> delegate;
@property (nonatomic,strong) ConsultDetailResult *result;
@end
