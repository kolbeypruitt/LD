//
//  WithDrawTool.m
//  邻医家
//
//  Created by Daniel on 15/6/13.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "BaseResult.h"
#import "EmployDetailParam.h"
#import "MJExtension.h"
#import "LDHttpTool.h"
#import "WithDrawTool.h"
#import "Common.h"

@implementation WithDrawTool
+ (void)withDrawResumeWithParam:(EmployDetailParam *)param success:(void (^)(BaseResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:WITHDRAWNURL params:param.keyValues success:^(id json) {
        if (success) {
            BaseResult *result = [BaseResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
