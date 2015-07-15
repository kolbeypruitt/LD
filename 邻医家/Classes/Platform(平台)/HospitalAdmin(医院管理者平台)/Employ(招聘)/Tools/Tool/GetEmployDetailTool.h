//
//  GetEmployDetailTool.h
//  邻医家
//
//  Created by Daniel on 15/6/11.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class EmployDetailParam,EmployDetail;
#import <Foundation/Foundation.h>

@interface GetEmployDetailTool : NSObject
+ (void)getEmployDetailWithParam:(EmployDetailParam *)param
                         success:(void (^)(EmployDetail *result))success
                         failure:(void (^)(NSError *error))failure;
@end
