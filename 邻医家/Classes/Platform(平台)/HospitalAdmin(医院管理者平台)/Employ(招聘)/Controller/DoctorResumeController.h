//
//  DoctorResumeController.h
//  邻医家
//
//  Created by Daniel on 15/6/12.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class Employer;
#import "LDMessageController.h"
@interface DoctorResumeController : LDMessageController
@property (nonatomic,strong) Employer *employer;
@end
