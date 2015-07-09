//
//  ReleaseCaseTool.m
//  邻医家
//
//  Created by Daniel on 15/7/9.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "ReleaseCaseParam.h"
#import "BaseResult.h"
#import "MJExtension.h"
#import "LDHttpTool.h"
#import "Common.h"
#import "ReleaseCaseTool.h"

@implementation ReleaseCaseTool
+ (void)releaseCaseWithParam:(ReleaseCaseParam *)param success:(void (^)(BaseResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:RELEASECASEURL params:param.keyValues success:^(id json) {
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
