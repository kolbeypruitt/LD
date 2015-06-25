//
//  RecruitDetailTool.h
//  邻医家
//
//  Created by Daniel on 15/6/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class CaseDetailParam,RecruitDetailResult;
#import <Foundation/Foundation.h>

@interface RecruitDetailTool : NSObject
+ (void)recruitDetailWithParam:(CaseDetailParam *)param
                       success:(void (^)(RecruitDetailResult *result))success
                       failure:(void (^)(NSError *error))failure;
@end
