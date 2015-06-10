//
//  QueryConsultTool.m
//  邻医家
//
//  Created by Daniel on 15/6/10.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDBaseParam.h"
#import "Common.h"
#import "LDHttpTool.h"
#import "QueryConsultTool.h"
#import "MJExtension.h"
#import "QueryConsultResult.h"
@implementation QueryConsultTool
+ (void)queryConsultWithParam:(LDBaseParam *)param success:(void (^)(QueryConsultResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:QUERYCONSULTURL params:param.keyValues success:^(id json) {
        if (success) {
            QueryConsultResult *result = [QueryConsultResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
