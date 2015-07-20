//
//  UserTool.m
//  邻医家
//
//  Created by Daniel on 15/7/20.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDBaseParam.h"
#import "UserTool.h"
#import "Common.h"
#import "MJExtension.h"
#import "LDHttpTool.h"
#import "UserResult.h"
@implementation UserTool
+ (void)userWithParam:(LDBaseParam *)param success:(void (^)(UserResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:USEINFOURL params:param.keyValues success:^(id json) {
        if (success) {
            UserResult *result = [UserResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
