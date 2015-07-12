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
#import "InfoListResult.h"
@implementation ApplianTool
+ (void)myInviteSuccess:(void (^)(InfoListResult *))success failure:(void (^)(NSError *))failure
{
    LDBaseParam *param = [LDBaseParam param];
    [LDHttpTool getWithURL:MYINVITEURL params:param.keyValues success:^(id json) {
        if (success) {
            InfoListResult *result = [InfoListResult objectWithKeyValues:json];
            success(result);
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
+ (void)myAppliantWithParam:(LDBaseParam *)param success:(void (^)(AppliantDetailResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:MYAPPLIANTDETAILURL params:param.keyValues success:^(id json) {
        if (success) {
            AppliantDetailResult *result = [AppliantDetailResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        
    }];
}


+ (void)myInviteDetailWithParam:(LDBaseParam *)param success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:MYINVITETDETAILURL params:param.keyValues success:^(id json) {
        if (success) {
            success(json);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}



@end

@implementation AppliantDetailResult


@end
















