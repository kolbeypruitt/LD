//
//  DepartmentListToll.m
//  邻医家
//
//  Created by Daniel on 15/7/16.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDHttpTool.h"
#import "MJExtension.h"
#import "LDBaseParam.h"
#import "ListResult.h"
#import "DepartmentListToll.h"
#import "Common.h"

@implementation DepartmentListToll
+ (void)allListWithParam:(LDBaseParam *)param success:(void (^)(ListResult *))success failure:(void (^)(NSError *))failure
{
   [LDHttpTool getWithURL:DEPMENTALLURL params:param.keyValues success:^(id json) {
       if (success) {
           ListResult *result = [ListResult objectWithKeyValues:json];
           success(result);
       }
   } failure:^(NSError *error) {
       if (failure) {
           failure(error);
       }
   }];
    
}

+ (void)acceptedWithParam:(LDBaseParam *)param success:(void (^)(ListResult *))success failure:(void (^)(NSError *))failure
{
    [LDHttpTool getWithURL:DEPMENTACCEPTURL params:param.keyValues success:^(id json) {
       if (success) {
           ListResult *result = [ListResult objectWithKeyValues:json];
           success(result);
       }
   } failure:^(NSError *error) {
       if (failure) {
           failure(error);
       }
   }];
}
@end
