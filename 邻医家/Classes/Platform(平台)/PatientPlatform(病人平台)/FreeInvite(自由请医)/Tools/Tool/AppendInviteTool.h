//
//  AppendInviteTool.h
//  邻医家
//
//  Created by Daniel on 15/6/18.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class BaseResult;
#import <Foundation/Foundation.h>

@interface AppendInviteTool : NSObject
+ (void)appendInviteWithParam:(NSDictionary *)param
                      success:(void (^)(BaseResult *result))success
                      failure:(void (^)(NSError *error))failure;
@end
