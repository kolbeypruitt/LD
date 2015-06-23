//
//  WithDrawConsultTool.m
//  邻医家
//
//  Created by SXQ on 15/6/20.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "WithDrawConsultTool.h"
#import "LDHttpTool.h"
#import "ConsultDetailParam.h"
#import "BaseResult.h"
#import "Common.h"
#import "MJExtension.h"
@implementation WithDrawConsultTool
+ (void)withDrawConsultWithParam:(ConsultDetailParam *)param success:(void (^)(BaseResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:DEPARTMENTWITHDRAWURL params:param.keyValues success:^(id json) {
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
