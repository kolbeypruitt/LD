//
//  PatientEnterTool.m
//  邻医家
//
//  Created by Daniel on 15/6/4.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDHttpTool.h"
#import "MJExtension.h"
#import "Common.h"
#import "PatientEnterParam.h"
#import "BaseResult.h"
#import "PatientEnterTool.h"

@implementation PatientEnterTool
+ (void)uploadPatientDataWithParam:(PatientEnterParam *)param
                     formDataArray:(NSArray *)formDataArray
                           success:(void (^)(BaseResult *))success
                           failure:(void (^)(NSError *))failure
{
    [LDHttpTool postWithURL:PATIENTENTERURL params:param.keyValues formDataArray:formDataArray success:^(id json) {
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
