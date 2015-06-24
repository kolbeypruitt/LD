//
//  DoctorDetailResult.h
//  邻医家
//
//  Created by Daniel on 15/6/24.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class Doctor;
#import <Foundation/Foundation.h>

@interface DoctorDetailResult : NSObject
@property (nonatomic,copy) NSString *status;
@property (nonatomic,strong) Doctor *doctor;
@end
