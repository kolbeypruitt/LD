//
//  DocReplyTool.m
//  邻医家
//
//  Created by Daniel on 15/7/28.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "Common.h"
#import "LDHttpTool.h"
#import "MJExtension.h"
#import "LDBaseParam.h"
#import "BaseResult.h"
#import "DocReplyTool.h"

@implementation DocReplyTool
+ (void)replyConsultWithParam:(LDBaseParam *)param success:(void (^)(BaseResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:DOCTORREPLYCONSULTURL params:param.keyValues success:^(id json) {
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
