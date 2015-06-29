//
//  SearchHosTool.m
//  邻医家
//
//  Created by Daniel on 15/6/29.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "SearchHosParam.h"
#import "SearchHosResult.h"
#import "LDHttpTool.h"
#import "Common.h"
#import "MJExtension.h"
#import "SearchHosTool.h"

@implementation SearchHosTool
+ (void)searchHosWithParam:(SearchHosParam *)param success:(void (^)(SearchHosResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:SEARCHHOSURL params:param.keyValues success:^(id json) {
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
