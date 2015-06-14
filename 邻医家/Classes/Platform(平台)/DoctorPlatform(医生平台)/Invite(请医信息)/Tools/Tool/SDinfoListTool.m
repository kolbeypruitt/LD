//
//  SDinfoListTool.m
//  邻医家
//
//  Created by Daniel on 15/6/14.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "MJExtension.h"
#import "LDBaseParam.h"
#import "InfoListResult.h"
#import "LDHttpTool.h"
#import "SDinfoListTool.h"
#import "Common.h"

@implementation SDinfoListTool
+ (void)getSDInfoListWithParam:(LDBaseParam *)param success:(void (^)(InfoListResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:SDINFOLISTURL params:param.keyValues success:^(id json) {
        if (success) {
            InfoListResult *result = [InfoListResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
