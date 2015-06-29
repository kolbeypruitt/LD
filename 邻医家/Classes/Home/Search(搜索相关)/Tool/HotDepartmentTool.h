//
//  HotDepartmentTool.h
//  邻医家
//
//  Created by Daniel on 15/6/29.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

@class HotDepartmentResult;
#import <Foundation/Foundation.h>

@interface HotDepartmentTool : NSObject
+ (void)hotDeapartmentSuccess:(void (^)(HotDepartmentResult *result))success
                      failure:(void (^)(NSError *error))failure;
@end
