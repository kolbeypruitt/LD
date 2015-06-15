//
//  PatientInviteDetailTool.m
//  邻医家
//
//  Created by Daniel on 15/6/15.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "Common.h"
#import "MJExtension.h"
#import "LDHttpTool.h"
#import "FreeDetailMsgParam.h"
#import "PatientInviteDetailTool.h"
#import "FreeInviteDeResult.h"
@implementation PatientInviteDetailTool
+ (void)patientInviteDetailWithParam:(FreeDetailMsgParam *)param success:(void (^)(FreeInviteDeResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:PATIENTINVITEDEURL params:param.keyValues success:^(id json) {
        if (success) {
            FreeInviteDeResult *result = [FreeInviteDeResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
