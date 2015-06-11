//
//  GetAcceptedResumeTool.h
//  邻医家
//
//  Created by Daniel on 15/6/11.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class EmployDetailParam,GetAcceptedResult;
#import <Foundation/Foundation.h>
@interface GetAcceptedResumeTool : NSObject
+ (void)getAcceptResumeWithParam:(EmployDetailParam *)param
                         success:(void (^)(GetAcceptedResult *result))success
                         failure:(void (^)(NSError *erro))failure;
@end
