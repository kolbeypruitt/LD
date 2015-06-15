//
//  PatientInviteListTool.m
//  邻医家
//
//  Created by Daniel on 15/6/15.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "InviteDocListParam.h"
#import "InfoListResult.h"
#import "Common.h"
#import "LDHttpTool.h"
#import "PatientInviteListTool.h"
#import "MJExtension.h"
@implementation PatientInviteListTool
+ (void)patienInviteListWithParam:(InviteDocListParam *)param success:(void (^)(InfoListResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:SEEKDOCLISTURL params:param.keyValues success:^(id json) {
        if (success) {
            InfoListResult *result = [InfoListResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
