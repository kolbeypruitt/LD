//
//  ManagerDetailTool.h
//  邻医家
//
//  Created by Daniel on 15/7/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class LDBaseParam,ManagerDetailResult;
#import <Foundation/Foundation.h>

@interface ManagerDetailTool : NSObject
+ (void)managerDetailWithParam:(LDBaseParam *)param
                       success:(void (^)(ManagerDetailResult *result))success
                       failure:(void (^)(NSError *error))failure;
@end
