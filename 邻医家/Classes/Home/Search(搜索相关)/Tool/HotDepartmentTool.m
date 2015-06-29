//
//  HotDepartmentTool.m
//  邻医家
//
//  Created by Daniel on 15/6/29.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "MJExtension.h"
#import "LDHttpTool.h"
#import "HotDepartmentTool.h"
#import "Common.h"
#import "HotDepartmentResult.h"
@implementation HotDepartmentTool
+ (void)hotDeapartmentSuccess:(void (^)(HotDepartmentResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:HOTDEPARTMENTURL params:nil success:^(id json) {
        if (success) {
            HotDepartmentResult *result = [HotDepartmentResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
