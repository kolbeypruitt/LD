//
//  LoginDocDetailController.h
//  邻医家
//
//  Created by Daniel on 15/6/6.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class Doctor;
#import <UIKit/UIKit.h>

@interface LoginDocDetailController : UIViewController
@property (nonatomic,strong) Doctor *doctor;
@property (nonatomic,assign) BOOL isDoctor;
@end
