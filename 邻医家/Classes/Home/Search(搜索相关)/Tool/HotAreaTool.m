//
//  HotAreaTool.m
//  邻医家
//
//  Created by Daniel on 15/6/23.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDHttpTool.h"
#import "HotAreaResult.h"
#import "HotAreaTool.h"
#import "Common.h"
#import "MJExtension.h"

@implementation HotAreaTool
+ (void)hotAreaSuccess:(void (^)(HotAreaResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:HOTAREAURL params:nil success:^(id json) {
        if (success) {
            HotAreaResult *result = [HotAreaResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        
    }];
}
@end
