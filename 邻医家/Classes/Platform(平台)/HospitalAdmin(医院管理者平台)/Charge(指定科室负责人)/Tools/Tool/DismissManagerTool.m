//
//  DismissManagerTool.m
//  邻医家
//
//  Created by Daniel on 15/7/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDBaseParam.h"
#import "BaseResult.h"
#import "MJExtension.h"
#import "Common.h"
#import "DismissManagerTool.h"
#import "LDHttpTool.h"
@implementation DismissManagerTool
+ (void)dismissManagerWithParam:(LDBaseParam *)param success:(void (^)(BaseResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:DISMISSMANAGERURL params:param.keyValues success:^(id json) {
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
