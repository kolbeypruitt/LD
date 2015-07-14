//
//  AppendInviteTool.m
//  邻医家
//
//  Created by Daniel on 15/6/18.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "Common.h"
#import "LDHttpTool.h"
#import "MJExtension.h"
#import "BaseResult.h"
#import "AppendInviteParam.h"
#import "AppendInviteTool.h"

@implementation AppendInviteTool
+ (void)appendInviteWithParam:(NSDictionary *)param success:(void (^)(BaseResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:APPENDINVITEURL params:param success:^(id json) {
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
