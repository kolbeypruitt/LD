//
//  ResponsedDoctorView.h
//  邻医家
//
//  Created by Daniel on 15/6/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class ResponsedDoctorView;
#import <UIKit/UIKit.h>
@protocol ResponsedDoctorViewDelegate <NSObject>
@optional
- (void)responsedDoctorView:(ResponsedDoctorView *)doctorView inviteBtnClicked:(UIButton *)inviteBtn;
@end


@interface ResponsedDoctorView : UIView
@property (nonatomic,weak) id<ResponsedDoctorViewDelegate> delegate;
@end
