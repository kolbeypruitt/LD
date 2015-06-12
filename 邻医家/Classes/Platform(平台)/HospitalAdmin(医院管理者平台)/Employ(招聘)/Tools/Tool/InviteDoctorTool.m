//
//  InviteDoctorTool.m
//  邻医家
//
//  Created by Daniel on 15/6/12.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "MJExtension.h"
#import "EmployDetailParam.h"
#import "BaseResult.h"
#import "InviteDoctorTool.h"
#import "Common.h"
#import "LDHttpTool.h"
@implementation InviteDoctorTool
+ (void)inviteDoctorWithParam:(EmployDetailParam *)param success:(void (^)(BaseResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:ENROLLDOCTORURL params:param.keyValues success:^(id json) {
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
