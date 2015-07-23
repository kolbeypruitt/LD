//
//  ChangeArrangeTool.m
//  邻医家
//
//  Created by Daniel on 15/7/23.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDArrangementParam.h"
#import "Common.h"
#import "BaseResult.h"
#import "ChangeArrangeTool.h"
#import "LDHttpTool.h"
#import "MJExtension.h"

@implementation ChangeArrangeTool
+ (void)changeArrangeWithParam:(LDArrangementParam *)param success:(void (^)(BaseResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:CHANGEARRANGEMENTURL params:param.keyValues success:^(id json) {
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
