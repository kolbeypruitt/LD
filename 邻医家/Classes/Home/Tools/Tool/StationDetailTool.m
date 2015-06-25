//
//  StationDetailTool.m
//  邻医家
//
//  Created by Daniel on 15/6/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "Common.h"  
#import "LDHttpTool.h"
#import "StationDetailResult.h"
#import "CaseDetailParam.h"
#import "StationDetailTool.h"
#import "MJExtension.h"
@implementation StationDetailTool
+ (void)stationDetailWithParam:(CaseDetailParam *)param success:(void (^)(StationDetailResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:DOCTORSTATIONDETAILURL params:param.keyValues success:^(id json) {
        if (success) {
            StationDetailResult *result = [StationDetailResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
