//
//  DoctorDetailTool.m
//  邻医家
//
//  Created by Daniel on 15/6/24.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "MJExtension.h"
#import "LDHttpTool.h"
#import "DoctorDetailTool.h"
#import "Common.h"
#import "DoctorDetailParam.h"
#import "DoctorDetailResult.h"
@implementation DoctorDetailTool
+ (void)doctorDetailWithParam:(DoctorDetailParam *)param success:(void (^)(DoctorDetailResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:DOCTORDETAILURL params:param.keyValues success:^(id json) {
        if (success) {
            DoctorDetailResult *result = [DoctorDetailResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
