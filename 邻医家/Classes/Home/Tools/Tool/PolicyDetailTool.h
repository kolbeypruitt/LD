//
//  PolicyDetailTool.h
//  邻医家
//
//  Created by Daniel on 15/6/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class CaseDetailParam,PolicyDetailResult;
#import <Foundation/Foundation.h>

@interface PolicyDetailTool : NSObject
+ (void)policyDetailWithParam:(CaseDetailParam *)param
                      success:(void (^)(PolicyDetailResult *result))success
                      failure:(void (^)(NSError *error))failure;
@end
