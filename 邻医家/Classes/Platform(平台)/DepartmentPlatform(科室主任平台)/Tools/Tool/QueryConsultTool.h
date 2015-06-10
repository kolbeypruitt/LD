//
//  QueryConsultTool.h
//  邻医家
//
//  Created by Daniel on 15/6/10.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class LDBaseParam,QueryConsultResult;
#import <Foundation/Foundation.h>

@interface QueryConsultTool : NSObject
+ (void)queryConsultWithParam:(LDBaseParam *)param
                      success:(void (^)(QueryConsultResult *result))success
                      failure:(void (^)(NSError *error))failure;
@end
