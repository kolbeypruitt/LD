//
//  LDMessageHeader.h
//  邻医家
//
//  Created by Daniel on 15/7/15.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class PatienInviteDetail,EmployDetail,ConsutlDetailResult;
#import <UIKit/UIKit.h>

@interface LDMessageHeader : UIView
@property (nonatomic,strong) EmployDetail *empDetail;
@property (nonatomic,strong) PatienInviteDetail *inviteDetail;
@property (nonatomic,strong) ConsutlDetailResult *consultResult;
@property (nonatomic,weak) UIButton *acceptBtn;
@property (nonatomic,weak) UIButton *allBtn;
@end
