//
//  RecruitTool.m
//  邻医家
//
//  Created by Daniel on 15/6/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "MJExtension.h"
#import "RecruitParam.h"
#import "Common.h"
#import "RecruitTool.h"
#import "LDHttpTool.h"
#import "RecruitResult.h"
@implementation RecruitTool
+ (void)recruitWithParam:(RecruitParam *)param success:(void (^)(RecruitResult *))success failure:(void (^)(NSError *))failure
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
@end
