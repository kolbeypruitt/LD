//
//  PostedCaseTool.m
//  邻医家
//
//  Created by Daniel on 15/7/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDBaseParam.h"
#import "PostedCaseTool.h"
#import "MJExtension.h"
#import "PostedCaseResult.h"
#import "Common.h"
#import "LDHttpTool.h"
@implementation PostedCaseTool
+ (void)postedCaseWithParam:(LDBaseParam *)param success:(void (^)(PostedCaseResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:POSTEDCASELISTURL params:param.keyValues success:^(id json) {
        if (success) {
            PostedCaseResult *result = [PostedCaseResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
