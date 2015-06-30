//
//  HotHosTool.m
//  邻医家
//
//  Created by Daniel on 15/6/30.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "HotHosTool.h"
#import "SearchHosResult.h"
#import "LDHttpTool.h"
#import "Common.h"
#import "MJExtension.h"
@implementation HotHosTool
+ (void)hotHosSuccess:(void (^)(SearchHosResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:HOTHOSURL params:nil success:^(id json) {
        if (success) {
            SearchHosResult *result = [SearchHosResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
