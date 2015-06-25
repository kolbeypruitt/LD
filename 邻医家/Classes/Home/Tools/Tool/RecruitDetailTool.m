//
//  RecruitDetailTool.m
//  邻医家
//
//  Created by Daniel on 15/6/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "RecruitDetailTool.h"
#import "CaseDetailParam.h"
#import "RecruitDetailResult.h"
#import "MJExtension.h"
#import "Common.h"
#import "LDHttpTool.h"
@implementation RecruitDetailTool
+ (void)recruitDetailWithParam:(CaseDetailParam *)param success:(void (^)(RecruitDetailResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:RECRUITDETAILURL params:param.keyValues success:^(id json) {
        if (success) {
            RecruitDetailResult *result = [RecruitDetailResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
