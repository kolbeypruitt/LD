//
//  WithDrawDocTool.m
//  邻医家
//
//  Created by Daniel on 15/6/17.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "Common.h"
#import "AllInviteParam.h"
#import "BaseResult.h"
#import "LDHttpTool.h"
#import "MJExtension.h"
#import "WithDrawDocTool.h"

@implementation WithDrawDocTool
+ (void)withDrawDocWithParam:(AllInviteParam *)param success:(void (^)(BaseResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:DELETEEMPLOYURL params:param.keyValues success:^(id json) {
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
