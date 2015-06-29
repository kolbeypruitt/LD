//
//  CoreExpertTool.m
//  邻医家
//
//  Created by Daniel on 15/6/29.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "CoreExpertTool.h"
#import "MJExtension.h"
#import "Common.h"
#import "LDHttpTool.h"  
#import "CoreExpertResult.h"
@implementation CoreExpertTool
+ (void)coreExpertSuccess:(void (^)(CoreExpertResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:COREEXPERTURL params:nil success:^(id json) {
        if (success) {
            CoreExpertResult *result = [CoreExpertResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
