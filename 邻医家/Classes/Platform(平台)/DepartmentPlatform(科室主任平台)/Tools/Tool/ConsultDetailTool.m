//
//  ConsultDetailTool.m
//  邻医家
//
//  Created by Daniel on 15/6/10.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "ConsultDetailTool.h"
#import "MJExtension.h"
#import "Common.h"
#import "LDHttpTool.h"
#import "ConsutlDetailResult.h"
#import "ConsultDetailParam.h"
@implementation ConsultDetailTool
+ (void)consultDetailWithParam:(ConsultDetailParam *)param success:(void (^)(ConsutlDetailResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:CONSULTDETAILURL params:param.keyValues success:^(id json) {
        if (success) {
            ConsutlDetailResult *result = [ConsutlDetailResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
