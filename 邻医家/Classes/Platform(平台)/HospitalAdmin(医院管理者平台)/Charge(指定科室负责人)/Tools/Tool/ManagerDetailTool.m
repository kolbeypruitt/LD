//
//  ManagerDetailTool.m
//  邻医家
//
//  Created by Daniel on 15/7/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "Common.h"
#import "LDHttpTool.h"
#import "MJExtension.h"
#import "LDBaseParam.h"
#import "ManagerDetailResult.h"
#import "ManagerDetailTool.h"

@implementation ManagerDetailTool
+ (void)managerDetailWithParam:(LDBaseParam *)param success:(void (^)(ManagerDetailResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:MANAGERDETAILURL params:param.keyValues success:^(id json) {
        if (success) {
            ManagerDetailResult *result = [ManagerDetailResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
