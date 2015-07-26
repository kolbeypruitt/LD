//
//  SearchRecruitTool.m
//  邻医家
//
//  Created by Daniel on 15/7/21.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "RecruitParam.h"
#import "SearchRecruitTool.h"
#import "StationListResult.h"
#import "PostDocParam.h"
#import "Common.h"
#import "MJExtension.h" 
#import "LDHttpTool.h"
#import "RecruitResult.h"
@implementation SearchRecruitTool
+ (void)searchRecruitWithParam:(RecruitParam *)param success:(void (^)(RecruitResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:RECRUITURL params:param.keyValues success:^(id json) {
        if (success) {
            RecruitResult *result = [RecruitResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
+ (void)searchDoctorStationWithParam:(PostDocParam *)param success:(void (^)(StationListResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:SEARCHDOCTORSTATIONURL params:param.keyValues success:^(id json) {
        if (success) {
            StationListResult *result = [StationListResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
