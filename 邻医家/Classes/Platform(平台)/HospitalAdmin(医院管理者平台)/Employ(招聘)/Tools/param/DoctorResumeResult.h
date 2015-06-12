//
//  DoctorResumeResult.h
//  邻医家
//
//  Created by Daniel on 15/6/12.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class DoctorResume;
#import <Foundation/Foundation.h>

@interface DoctorResumeResult : NSObject
@property (nonatomic,strong) DoctorResume *resume;
@property (nonatomic,copy) NSString *status;
@end
