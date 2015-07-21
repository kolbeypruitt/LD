//
//  SearchRecruitTool.h
//  邻医家
//
//  Created by Daniel on 15/7/21.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class RecruitParam,RecruitResult,PostDocParam;
#import <Foundation/Foundation.h>

@interface SearchRecruitTool : NSObject
+ (void)searchRecruitWithParam:(RecruitParam *)param
                       success:(void (^)(RecruitResult *result))success
                       failure:(void (^)(NSError *error))failure;
+ (void)searchDoctorStationWithParam:(PostDocParam *)param
                             success:(void (^)(id result))success
                             failure:(void (^)(NSError *error))failure;
@end
