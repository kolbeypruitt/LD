//
//  PostArrangeTool.m
//  邻医家
//
//  Created by Daniel on 15/6/12.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "DocArrangementParam.h"
#import "LDHttpTool.h"
#import "BaseResult.h"
#import "MJExtension.h"
#import "PostArrangeTool.h"
#import "Common.h"
@implementation PostArrangeTool
+ (void)postArrangeWithParam:(DocArrangementParam *)param success:(void (^)(BaseResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:SENDDOCARRANGEMENTURL params:param.keyValues success:^(id json) {
        if (success) {
            BaseResult *result = [BaseResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        
    }];
}
@end
