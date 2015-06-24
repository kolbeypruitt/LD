//
//  HospitalResult.h
//  邻医家
//
//  Created by Daniel on 15/6/24.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class HospitalDetail;
#import <Foundation/Foundation.h>

@interface HospitalResult : NSObject
@property (nonatomic,strong) HospitalDetail *doctor;
@property (nonatomic,copy) NSString *status;
@end
