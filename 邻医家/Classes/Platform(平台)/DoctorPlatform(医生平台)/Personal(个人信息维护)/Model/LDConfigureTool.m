//
//  LDConfigureTool.m
//  邻医家
//
//  Created by SXQ on 15/7/23.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDBaseParam.h"
#import "LDConfigureParam.h"
#import "BaseResult.h"
#import "LDConfigureResult.h"
#import "LDConfigureTool.h"
#import "LDHttpTool.h"
#import "MJExtension.h"
#import "Common.h"

@implementation LDConfigureTool
+ (void)getConfigureWithParam:(LDBaseParam *)param success:(void (^)(LDConfigureResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:GETDOCTORCONFIGUREURL params:param.keyValues success:^(id json) {
        if (success) {
            LDConfigureResult *result = [LDConfigureResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
+ (void)changeConfigureWithParam:(LDConfigureParam *)param success:(void (^)(BaseResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:CHANGEDOCTORCONFIGUREURL params:param.keyValues success:^(id json) {
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
