//
//  ReleaseArrangeTool.h
//  邻医家
//
//  Created by Daniel on 15/7/9.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class BaseResult,ReleaseArrangeParam;
#import <Foundation/Foundation.h>

@interface ReleaseArrangeTool : NSObject
+ (void)releaseArrangeWithParam:(ReleaseArrangeParam *)param
                        success:(void (^)(BaseResult *result))success
                        failure:(void (^)(NSError *error))failure;
@end
