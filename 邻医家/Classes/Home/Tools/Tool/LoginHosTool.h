//
//  LoginHosTool.h
//  邻医家
//
//  Created by Daniel on 15/6/26.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class LDBaseParam,LoginHosResult;
#import <Foundation/Foundation.h>

@interface LoginHosTool : NSObject
+ (void)loginHosWithParam:(LDBaseParam *)param
                  success:(void (^)(LoginHosResult *result))success
                  failure:(void (^)(NSError *error))failure;
@end
