//
//  GetEmployDetailTool.m
//  邻医家
//
//  Created by Daniel on 15/6/11.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDHttpTool.h"
#import "EmployDetailParam.h"
#import "EmployDetail.h"
#import "GetEmployDetailTool.h"
#import "MJExtension.h"
#import "Common.h"
@implementation GetEmployDetailTool
+ (void)getEmployDetailWithParam:(EmployDetailParam *)param success:(void (^)(EmployDetail *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:GETEMPLOYDETAILURL params:param.keyValues success:^(id json) {
        if (success) {
            EmployDetail *result = [EmployDetail objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
