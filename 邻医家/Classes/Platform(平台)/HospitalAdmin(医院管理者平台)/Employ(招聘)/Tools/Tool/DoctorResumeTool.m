//
//  DoctorResumeTool.m
//  邻医家
//
//  Created by Daniel on 15/6/12.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "DoctorResumeTool.h"
#import "DoctorResumeResult.h"
#import "EmployDetailParam.h"
#import "LDHttpTool.h"
#import "MJExtension.h"
#import "Common.h"
@implementation DoctorResumeTool
+ (void)getDoctorResumeWithParam:(EmployDetailParam *)param success:(void (^)(DoctorResumeResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:GETDOCTORRESUMEURL params:param.keyValues success:^(id json) {
        if (success) {
            DoctorResumeResult *result = [DoctorResumeResult objectWithKeyValues:json];
            success(result);
            
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
