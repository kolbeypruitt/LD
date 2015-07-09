//
//  ArrangementDetailTool.m
//  邻医家
//
//  Created by Daniel on 15/7/9.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDHttpTool.h"
#import "Common.h"
#import "LDBaseParam.h"
#import "ArrangementDetailResult.h"
#import "ArrangementDetailTool.h"
#import "MJExtension.h"
@implementation ArrangementDetailTool
+ (void)arrangementWithParam:(LDBaseParam *)param success:(void (^)(ArrangementDetailResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:DOCARRANGEMENTDETAILURL params:param.keyValues success:^(id json) {
        if (success) {
            ArrangementDetailResult *result = [ArrangementDetailResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
