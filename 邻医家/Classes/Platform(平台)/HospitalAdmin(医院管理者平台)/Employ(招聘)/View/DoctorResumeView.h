//
//  DoctorResumeView.h
//  邻医家
//
//  Created by Daniel on 15/6/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class DoctorResumeView,DoctorResume;
#import <UIKit/UIKit.h>
@protocol DoctorResumeViewDelegate <NSObject>
@optional
- (void)DoctorResumeView:(DoctorResumeView *)doctorView inviteBtnClicked:(UIButton *)inviteBtn;
- (void)doctorResumeView:(DoctorResumeView *)doctorView chatBtnClicked:(UIButton *)chatBtn;

@end


@interface DoctorResumeView : UIView
@property (nonatomic,weak) id<DoctorResumeViewDelegate> delegate;
@property (nonatomic,strong) DoctorResume *resume;
@end
