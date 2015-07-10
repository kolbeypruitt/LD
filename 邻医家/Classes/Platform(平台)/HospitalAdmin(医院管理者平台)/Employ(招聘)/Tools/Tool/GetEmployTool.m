//
//  GetEmployTool.m
//  邻医家
//
//  Created by Daniel on 15/6/11.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDHttpTool.h"
#import "LDBaseParam.h"
#import "BaseResult.h"
#import "GetEmployTool.h"
#import "MJExtension.h"
#import "GetEmployeeResult.h"
#import "Common.h"
@implementation GetEmployTool
+ (void)getEmployWithParam:(LDBaseParam *)param url:(NSString *)url success:(void (^)(GetEmployeeResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:url params:param.keyValues success:^(id json) {
        if (success) {
            GetEmployeeResult *result = [GetEmployeeResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        failure(error);
    }];
}
@end
