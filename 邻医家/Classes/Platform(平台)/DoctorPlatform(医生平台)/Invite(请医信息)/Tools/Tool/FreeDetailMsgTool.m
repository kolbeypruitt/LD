//
//  FreeDetailMsgTool.m
//  邻医家
//
//  Created by Daniel on 15/6/14.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "MJExtension.h"
#import "FreeDetailMsgTool.h"
#import "Common.h"
#import "FreeDetailMsgParam.h"
#import "FreeMsgResult.h"
#import "LDHttpTool.h"
@implementation FreeDetailMsgTool
+ (void)getSDInfoWithParam:(FreeDetailMsgParam *)param success:(void (^)(FreeMsgResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:FREEDETAILURL params:param.keyValues success:^(id json) {
        if (success) {
            FreeMsgResult *result = [FreeMsgResult objectWithKeyValues:json];
            success(result);
            
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
