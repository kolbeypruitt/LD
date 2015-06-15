//
//  PatientInviteDetailTool.h
//  邻医家
//
//  Created by Daniel on 15/6/15.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class FreeDetailMsgParam,FreeInviteDeResult;
#import <Foundation/Foundation.h>

@interface PatientInviteDetailTool : NSObject
+ (void)patientInviteDetailWithParam:(FreeDetailMsgParam *)param
                             success:(void (^)(FreeInviteDeResult *result))success
                             failure:(void (^)(NSError *error))failure;
@end
