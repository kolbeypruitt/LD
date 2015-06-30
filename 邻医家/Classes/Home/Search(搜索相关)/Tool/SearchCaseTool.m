//
//  SearchCaseTool.m
//  邻医家
//
//  Created by Daniel on 15/6/30.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "SearchCaseParam.h"
#import "SearchCaseResult.h"
#import "SearchCaseTool.h"
#import "MJExtension.h"
#import "LDHttpTool.h"
#import "Common.h"
@implementation SearchCaseTool
+ (void)searchCaseWithParam:(SearchCaseParam *)param success:(void (^)(SearchCaseResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:SEARCHCASEURL params:param.keyValues success:^(id json) {
        if (success) {
            SearchCaseResult *result = [SearchCaseResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
