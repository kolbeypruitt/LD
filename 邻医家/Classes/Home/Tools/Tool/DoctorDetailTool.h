//
//  DoctorDetailTool.h
//  邻医家
//
//  Created by Daniel on 15/6/24.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class DoctorDetailParam,DoctorDetailResult;
#import <Foundation/Foundation.h>

@interface DoctorDetailTool : NSObject
+ (void)doctorDetailWithParam:(DoctorDetailParam *)param
                      success:(void (^)(DoctorDetailResult *result))success
                      failure:(void (^)(NSError *error))failure;
@end
