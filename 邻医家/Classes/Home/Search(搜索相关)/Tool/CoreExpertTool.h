//
//  CoreExpertTool.h
//  邻医家
//
//  Created by Daniel on 15/6/29.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class CoreExpertResult;
#import <Foundation/Foundation.h>

@interface CoreExpertTool : NSObject
+ (void)coreExpertSuccess:(void (^)(CoreExpertResult *result))success
                  failure:(void (^)(NSError *error))failure;
@end
