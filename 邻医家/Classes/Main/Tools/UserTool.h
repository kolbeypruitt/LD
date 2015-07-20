//
//  UserTool.h
//  邻医家
//
//  Created by Daniel on 15/7/20.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class LDBaseParam,UserResult;
#import <Foundation/Foundation.h>

@interface UserTool : NSObject
+ (void)userWithParam:(LDBaseParam *)param
              success:(void (^)(UserResult *result))success
              failure:(void (^)(NSError *error))failure;
@end
