//
//  DoctorEnterTool.m
//  邻医家
//
//  Created by Daniel on 15/6/3.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "DoctorEnterTool.h"
#import "DoctorEnterParam.h"
#import "BaseResult.h"
#import "MJExtension.h"
#import "Common.h"
#import "LDHttpTool.h"
@implementation DoctorEnterTool
+ (void)uploadDoctorDataWithParam:(DoctorEnterParam *)param
                    formDataArray:(NSArray *)formDataArray
                          success:(void (^)(BaseResult *))success
                          failure:(void (^)(NSError *))failure
{
    [LDHttpTool postWithURL:DOCTORENTERURL params:param.keyValues formDataArray:formDataArray success:^(id json) {
        BaseResult *result = [BaseResult objectWithKeyValues:json];
        if (success) {
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
