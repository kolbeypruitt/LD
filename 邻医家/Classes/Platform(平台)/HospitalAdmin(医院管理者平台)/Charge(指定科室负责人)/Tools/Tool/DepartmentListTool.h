//
//  DepartmentListTool.h
//  邻医家
//
//  Created by Daniel on 15/7/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class LDBaseParam,DepartmentListResult;
#import <Foundation/Foundation.h>

@interface DepartmentListTool : NSObject
+ (void)departmentListWithParam:(LDBaseParam *)param
                        success:(void (^)(DepartmentListResult *result))success
                        failure:(void (^)(NSError *error))failure;
@end
