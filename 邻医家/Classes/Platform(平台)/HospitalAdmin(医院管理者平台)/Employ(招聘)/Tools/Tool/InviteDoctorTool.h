//
//  InviteDoctorTool.h
//  邻医家
//
//  Created by Daniel on 15/6/12.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class EmployDetailParam,BaseResult;
#import <Foundation/Foundation.h>

@interface InviteDoctorTool : NSObject
+ (void)inviteDoctorWithParam:(EmployDetailParam *)param
                      success:(void (^)(BaseResult *result))success
                      failure:(void (^)(NSError *error))failure;
@end
