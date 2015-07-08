//
//  PostedCaseTool.h
//  邻医家
//
//  Created by Daniel on 15/7/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class LDBaseParam,PostedCaseResult;
#import <Foundation/Foundation.h>

@interface PostedCaseTool : NSObject
+ (void)postedCaseWithParam:(LDBaseParam *)param
                    success:(void (^)(PostedCaseResult *result))success
                    failure:(void (^)(NSError *error))failure;
@end
