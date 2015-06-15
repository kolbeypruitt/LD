//
//  AllInviteTool.m
//  邻医家
//
//  Created by Daniel on 15/6/15.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "AllInviteParam.h"
#import "AllInviteResult.h"
#import "MJExtension.h"
#import "Common.h"
#import "AllInviteTool.h"
#import "LDHttpTool.h"
@implementation AllInviteTool
+ (void)allInviteDataWithParam:(AllInviteParam *)param success:(void (^)(AllInviteResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:ALLDOCLISTURL params:param.keyValues success:^(id json) {
        if (success) {
            AllInviteResult *result = [AllInviteResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
