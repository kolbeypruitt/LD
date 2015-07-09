//
//  DocArrangeListTool.m
//  邻医家
//
//  Created by Daniel on 15/7/9.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDBaseParam.h"
#import "DocArrangeListTool.h"
#import "MJExtension.h"
#import "LDHttpTool.h"
#import "ArrangeListResult.h"
#import "Common.h"
@implementation DocArrangeListTool
+ (void)docArrangeListSuccess:(void (^)(ArrangeListResult *))success failure:(void (^)(NSError *))failure
{
    LDBaseParam *param = [LDBaseParam param];
    [LDHttpTool getWithURL:DOCARRANGEMENTLISTURL params:param.keyValues success:^(id json) {
        if (success) {
            ArrangeListResult *result = [ArrangeListResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
