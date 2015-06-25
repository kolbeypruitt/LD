//
//  PolicyDetailTool.m
//  邻医家
//
//  Created by Daniel on 15/6/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDHttpTool.h"
#import "Common.h"
#import "MJExtension.h"
#import "CaseDetailParam.h"
#import "PolicyDetailResult.h"
#import "PolicyDetailTool.h"

@implementation PolicyDetailTool
+ (void)policyDetailWithParam:(CaseDetailParam *)param success:(void (^)(PolicyDetailResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:MULTIJOBDETAILURL params:param.keyValues success:^(id json) {
        if (success) {
            PolicyDetailResult *result = [PolicyDetailResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
