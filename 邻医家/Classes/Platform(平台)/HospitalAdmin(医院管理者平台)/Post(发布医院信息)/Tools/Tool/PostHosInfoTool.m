//
//  PostHosInfoTool.m
//  邻医家
//
//  Created by Daniel on 15/6/12.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "HospitalInfoParam.h"
#import "BaseResult.h"
#import "LDHttpTool.h"
#import "MJExtension.h"
#import "PostHosInfoTool.h"
#import "Common.h"

@implementation PostHosInfoTool
+ (void)sendHosInfoWithParam:(HospitalInfoParam *)param success:(void (^)(BaseResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:SENDHOSPITALINFOURL params:param.keyValues success:^(id json) {
        if (success) {
            BaseResult *result = [BaseResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
