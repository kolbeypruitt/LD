//
//  ReplyInviteTool.m
//  邻医家
//
//  Created by Daniel on 15/6/14.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "FreeDetailMsgParam.h"
#import "BaseResult.h"
#import "LDHttpTool.h"
#import "MJExtension.h"
#import "ReplyInviteTool.h"
#import "Common.h"
@implementation ReplyInviteTool
+ (void)replyInviteMsgWithParam:(FreeDetailMsgParam *)param success:(void (^)(BaseResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:REPLYINVITEURL params:param.keyValues success:^(id json) {
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
