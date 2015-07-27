//
//  LoginDocDetailTool.m
//  邻医家
//
//  Created by Daniel on 15/6/26.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDBaseParam.h"
#import "LoginDocDetailResult.h"
#import "LoginDocDetailTool.h"
#import "Common.h"
#import "LDHttpTool.h"
#import "MJExtension.h"

@implementation LoginDocDetailTool
+ (void)loginDocdetailWithParam:(LDBaseParam *)param url:(NSString *)url success:(void (^)(LoginDocDetailResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:url params:param.keyValues success:^(id json) {
        if (success) {
            LoginDocDetailResult *result = [LoginDocDetailResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
