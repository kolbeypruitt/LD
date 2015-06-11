//
//  GetAllResumeTool.h
//  邻医家
//
//  Created by Daniel on 15/6/11.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class EmployDetailParam,GetAcceptedResult;
#import <Foundation/Foundation.h>

@interface GetAllResumeTool : NSObject
+ (void)getAllResumWithParam:(EmployDetailParam *)param
                     success:(void (^)(GetAcceptedResult *result))success
                     failure:(void (^)(NSError *error))failure;
@end
