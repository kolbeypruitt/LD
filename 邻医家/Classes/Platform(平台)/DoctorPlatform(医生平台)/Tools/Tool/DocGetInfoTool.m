//
//  DocGetInfoTool.m
//  邻医家
//
//  Created by Daniel on 15/6/13.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "DoctorConsultListParam.h"
#import "LDHttpTool.h"
#import "QueryConsultResult.h"
#import "MJExtension.h"
#import "DocGetInfoTool.h"
#import "Common.h"
@implementation DocGetInfoTool
+ (void)getGCInfoListWithParam:(DoctorConsultListParam *)param success:(void (^)(QueryConsultResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:GETGCINFOLISTURL params:param.keyValues success:^(id json) {
        if (success) {
            QueryConsultResult *result = [QueryConsultResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
