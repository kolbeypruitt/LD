//
//  ApplianTool.m
//  邻医家
//
//  Created by Daniel on 15/7/10.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "MJExtension.h"
#import "RecruitResult.h"
#import "LDBaseParam.h"
#import "Common.h"
#import "QueryConsultResult.h"
#import "ApplianTool.h"
#import "LDHttpTool.h"
@implementation ApplianTool
+ (void)myInviteSuccess:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    LDBaseParam *param = [LDBaseParam param];
    [LDHttpTool getWithURL:MYINVITEURL params:param.keyValues success:^(id json) {
        if (success) {
            success(json);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)myConsultSuccess:(void (^)(QueryConsultResult *))success failure:(void (^)(NSError *))failure
{
    LDBaseParam *param = [LDBaseParam param];
    [LDHttpTool getWithURL:MYCONSULTURL params:param.keyValues success:^(id json) {
        if (success) {
            QueryConsultResult *result = [QueryConsultResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
      if(failure)
      {
          failure(error);
      }
    }];
}

+ (void)myAppliantSuccess:(void (^)(RecruitResult *))success failure:(void (^)(NSError *))failure
{
    LDBaseParam *param = [LDBaseParam param];
    [LDHttpTool getWithURL:MYAPPLIANTURL params:param.keyValues success:^(id json) {
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
@end
