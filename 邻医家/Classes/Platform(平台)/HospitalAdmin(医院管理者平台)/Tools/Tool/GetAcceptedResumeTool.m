//
//  GetAcceptedResumeTool.m
//  邻医家
//
//  Created by Daniel on 15/6/11.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "EmployDetailParam.h"
#import "BaseResult.h"
#import "LDHttpTool.h"
#import "Common.h"
#import "MJExtension.h"
#import "GetAcceptedResumeTool.h"
#import "GetAcceptedResult.h"
@implementation GetAcceptedResumeTool
+ (void)getAcceptResumeWithParam:(EmployDetailParam *)param success:(void (^)(GetAcceptedResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:GETACCEPTEDURL params:param.keyValues success:^(id json) {
        if (success) {
            GetAcceptedResult *result = [GetAcceptedResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        failure(error);
    }];
}
@end
