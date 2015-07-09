//
//  ReleaseArrangeTool.m
//  邻医家
//
//  Created by Daniel on 15/7/9.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "Common.h"
#import "MJExtension.h"
#import "LDHttpTool.h"
#import "ReleaseArrangeParam.h"
#import "BaseResult.h"
#import "ReleaseArrangeTool.h"

@implementation ReleaseArrangeTool
+ (void)releaseArrangeWithParam:(ReleaseArrangeParam *)param success:(void (^)(BaseResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:RELEASEDOCARRANGEMENTURL params:param.keyValues success:^(id json) {
        if (success) {
            BaseResult  *result = [BaseResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
