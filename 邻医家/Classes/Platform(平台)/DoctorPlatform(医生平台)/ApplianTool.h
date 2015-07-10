//
//  ApplianTool.h
//  邻医家
//
//  Created by Daniel on 15/7/10.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class RecruitResult,QueryConsultResult;
#import <Foundation/Foundation.h>
@interface ApplianTool : NSObject
+ (void)myInviteSuccess:(void (^)(id result))success
                failure:(void (^)(NSError *error))failure;

+ (void)myConsultSuccess:(void (^)(QueryConsultResult *result))success
                 failure:(void (^)(NSError *error))failure;

+ (void)myAppliantSuccess:(void (^)(RecruitResult *result))success
                  failure:(void (^)(NSError *error))failure;
@end
