//
//  RecruitTool.h
//  邻医家
//
//  Created by Daniel on 15/6/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class RecruitParam,RecruitResult;
#import <Foundation/Foundation.h>

@interface RecruitTool : NSObject
+ (void)recruitWithParam:(RecruitParam *)param
                 success:(void (^)(RecruitResult *result))success
                 failure:(void (^)(NSError *error))failure;
@end
