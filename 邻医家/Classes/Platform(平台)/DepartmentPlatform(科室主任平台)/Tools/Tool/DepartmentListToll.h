//
//  DepartmentListToll.h
//  邻医家
//
//  Created by Daniel on 15/7/16.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class LDBaseParam,ListResult;
#import <Foundation/Foundation.h>

@interface DepartmentListToll : NSObject
+ (void)allListWithParam:(LDBaseParam *)param
                 success:(void (^)(ListResult *result))success
                 failure:(void (^)(NSError *error))failure;
+ (void)acceptedWithParam:(LDBaseParam *)param
                  success:(void (^)(ListResult *result))success
                  failure:(void (^)(NSError *error))failure;
@end
