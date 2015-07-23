//
//  LDConfigureTool.h
//  邻医家
//
//  Created by SXQ on 15/7/23.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class LDBaseParam,LDConfigureParam,LDConfigureResult,BaseResult;
#import <Foundation/Foundation.h>

@interface LDConfigureTool : NSObject
+ (void)getConfigureWithParam:(LDBaseParam *)param
                      success:(void (^)(LDConfigureResult *result))success
                      failure:(void (^)(NSError *error))failure;
+ (void)changeConfigureWithParam:(LDConfigureParam *)param
                         success:(void (^)(BaseResult *result))success
                         failure:(void (^)(NSError *error))failure;
@end
