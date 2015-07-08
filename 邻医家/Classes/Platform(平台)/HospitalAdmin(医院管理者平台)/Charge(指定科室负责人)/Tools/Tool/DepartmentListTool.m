//
//  DepartmentListTool.m
//  邻医家
//
//  Created by Daniel on 15/7/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDBaseParam.h"
#import "DepartmentListResult.h"
#import "LDHttpTool.h"
#import "Common.h"
#import "MJExtension.h"
#import "DepartmentListTool.h"

@implementation DepartmentListTool
+ (void)departmentListWithParam:(LDBaseParam *)param success:(void (^)(DepartmentListResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:DEPARTMENTLISTURL params:param.keyValues success:^(id json) {
        if (success) {
            DepartmentListResult *result = [DepartmentListResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
