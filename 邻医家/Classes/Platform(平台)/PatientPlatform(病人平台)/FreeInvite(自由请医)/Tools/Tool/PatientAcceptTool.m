//
//  PatientAcceptTool.m
//  邻医家
//
//  Created by Daniel on 15/6/15.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "EmployDetailParam.h"
#import "BaseResult.h"
#import "Common.h"
#import "MJExtension.h"
#import "LDHttpTool.h"
#import "PatientAcceptTool.h"

@implementation PatientAcceptTool
+ (void)acceptDocResumeWithParam:(EmployDetailParam *)param success:(void (^)(BaseResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:PATIENTACCEPTDOCURL params:param.keyValues success:^(id json) {
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
