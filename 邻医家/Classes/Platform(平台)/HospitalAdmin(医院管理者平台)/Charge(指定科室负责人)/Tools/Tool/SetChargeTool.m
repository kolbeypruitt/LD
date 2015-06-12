//
//  SetChargeTool.m
//  邻医家
//
//  Created by Daniel on 15/6/12.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "SetChargeTool.h"
#import "LDHttpTool.h"
#import "SetCharageParam.h"
#import "BaseResult.h"
#import "Common.h"
#import "MJExtension.h"
@implementation SetChargeTool
+ (void)setChargeWithParam:(SetCharageParam *)param success:(void (^)(BaseResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:SETCHARGEURL params:param.keyValues success:^(id json) {
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
