//
//  DocArrangeListTool.h
//  邻医家
//
//  Created by Daniel on 15/7/9.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class ArrangeListResult;
#import <Foundation/Foundation.h>

@interface DocArrangeListTool : NSObject
+ (void)docArrangeListSuccess:(void (^)(ArrangeListResult *result))success
                      failure:(void (^)(NSError *error))failure;
@end
