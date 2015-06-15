//
//  PatientInviteListTool.h
//  邻医家
//
//  Created by Daniel on 15/6/15.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class InviteDocListParam,InfoListResult;
#import <Foundation/Foundation.h>

@interface PatientInviteListTool : NSObject
+ (void)patienInviteListWithParam:(InviteDocListParam  *)param
                          success:(void (^)(InfoListResult *result))success
                          failure:(void(^)(NSError *error))failure;
@end
