//
//  GetAllResumeTool.m
//  邻医家
//
//  Created by Daniel on 15/6/11.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "EmployDetailParam.h"
#import "GetAllResumeTool.h"
#import "LDHttpTool.h"
#import "MJExtension.h"
#import "GetAcceptedResult.h"
#import "Common.h"
@implementation GetAllResumeTool
+ (void)getAllResumWithParam:(EmployDetailParam *)param success:(void (^)(GetAcceptedResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:GETALLRESUMEURL params:param.keyValues success:^(id json) {
        if (success) {
            GetAcceptedResult *result = [GetAcceptedResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
