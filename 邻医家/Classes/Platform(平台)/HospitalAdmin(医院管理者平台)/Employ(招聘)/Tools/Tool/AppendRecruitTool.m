//
//  AppendRecruitTool.m
//  邻医家
//
//  Created by Daniel on 15/7/7.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "AppendRecruitParam.h"
#import "BaseResult.h"
#import "Common.h"
#import "MJExtension.h"
#import "LDHttpTool.h"
#import "AppendRecruitTool.h"

@implementation AppendRecruitTool
+ (void)appendRecruitWithParam:(AppendRecruitParam *)param success:(void (^)(BaseResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:APPENDRECRUITURL params:param.keyValues success:^(id json) {
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
