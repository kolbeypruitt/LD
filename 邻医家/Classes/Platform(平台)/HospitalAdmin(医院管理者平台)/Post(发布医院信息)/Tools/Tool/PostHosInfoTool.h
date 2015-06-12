//
//  PostHosInfoTool.h
//  邻医家
//
//  Created by Daniel on 15/6/12.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class HospitalInfoParam,BaseResult;
#import <Foundation/Foundation.h>

@interface PostHosInfoTool : NSObject
+ (void)sendHosInfoWithParam:(HospitalInfoParam *)param
                     success:(void (^)(BaseResult *result))success
                     failure:(void (^)(NSError *error))failure;
@end
