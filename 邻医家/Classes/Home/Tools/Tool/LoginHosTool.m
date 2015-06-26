//
//  LoginHosTool.m
//  邻医家
//
//  Created by Daniel on 15/6/26.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDBaseParam.h"
#import "Common.h"
#import "LDHttpTool.h"
#import "MJExtension.h"
#import "LoginHosTool.h"
#import "LoginHosResult.h"
@implementation LoginHosTool
+ (void)loginHosWithParam:(LDBaseParam *)param success:(void (^)(LoginHosResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:TOKENHOSINFOURL params:param.keyValues success:^(id json) {
        if (success) {
            LoginHosResult *result = [LoginHosResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
