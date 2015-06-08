//
//  HospitalEnterTool.m
//  邻医家
//
//  Created by Daniel on 15/6/1.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "HospitalEnterTool.h"
#import "LDHttpTool.h"
#import "MJExtension.h"
#import "Common.h"
#import "HospitalEnterParam.h"
#import "HospitalEnterResult.h"
@implementation HospitalEnterTool
+ (void)uploadHospitalDataWithParam:(HospitalEnterParam *)param
                      formDataArray:(NSArray *)formDataArray
                            success:(void (^)(HospitalEnterResult *))success failure:(void (^)(NSError *))failure;
{
    [LDHttpTool postWithURL:HOSPITALENTERURL params:param.keyValues formDataArray:formDataArray success:^(id json) {
        if (success) {
            HospitalEnterResult *result = [HospitalEnterResult objectWithKeyValues:json];
            success(result);
            
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
