//
//  DoctorStationListTool.m
//  邻医家
//
//  Created by Daniel on 15/6/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "MJExtension.h"
#import "LDHttpTool.h"
#import "StationListResult.h"
#import "DoctorStationListTool.h"
#import "Common.h"
@implementation DoctorStationListTool
+ (void)doctorStationListSuccess:(void (^)(StationListResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:DOCTORSTATIONURL params:nil success:^(id json) {
        if (success) {
            StationListResult *result = [StationListResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
