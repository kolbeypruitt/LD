//
//  PostConsultTool.m
//  邻医家
//
//  Created by Daniel on 15/6/10.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "Common.h"
#import "PostConsultParam.h"
#import "BaseResult.h"
#import "PostConsultTool.h"
#import "LDHttpTool.h"
#import "MJExtension.h"
@implementation PostConsultTool
+ (void)postConsulWithParam:(PostConsultParam *)param success:(void (^)(BaseResult *))success failure:(void (^)(NSError *))failure
{
    //发送请求
    [LDHttpTool getWithURL:POSTCONSULTURL params:param.keyValues success:^(id json) {
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
