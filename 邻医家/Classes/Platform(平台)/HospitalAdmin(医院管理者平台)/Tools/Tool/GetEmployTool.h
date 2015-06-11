//
//  GetEmployTool.h
//  邻医家
//
//  Created by Daniel on 15/6/11.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class LDBaseParam,GetEmployeeResult;
#import <Foundation/Foundation.h>

@interface GetEmployTool : NSObject
+ (void)getEmployWithParam:(LDBaseParam *)param
                   success:(void (^)(GetEmployeeResult *result))success
                   failure:(void (^)(NSError *error))failure;
@end
