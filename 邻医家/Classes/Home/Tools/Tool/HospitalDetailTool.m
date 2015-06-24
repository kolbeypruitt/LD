//
//  HospitalDetailTool.m
//  邻医家
//
//  Created by Daniel on 15/6/24.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "HosdetailParam.h"
#import "Common.h"
#import "MJExtension.h"
#import "LDHttpTool.h"
#import "HospitalDetailTool.h"
#import "HospitalResult.h"
@implementation HospitalDetailTool
+ (void)hospitalDetailWithParam:(HosdetailParam *)param success:(void (^)(HospitalResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:HOSPITALDETAILURL params:param.keyValues success:^(id json) {
        if (success) {
            HospitalResult *result = [HospitalResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
