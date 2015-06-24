//
//  HospitalDetailTool.h
//  邻医家
//
//  Created by Daniel on 15/6/24.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class HosdetailParam,HospitalResult;
#import <Foundation/Foundation.h>

@interface HospitalDetailTool : NSObject
+ (void)hospitalDetailWithParam:(HosdetailParam *)param
                        success:(void (^)(HospitalResult *result))success
                        failure:(void (^)(NSError *error))failure;
@end
