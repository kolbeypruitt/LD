//
//  ArrangementDetailTool.h
//  邻医家
//
//  Created by Daniel on 15/7/9.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class LDBaseParam,ArrangementDetailResult;
#import <Foundation/Foundation.h>

@interface ArrangementDetailTool : NSObject
+ (void)arrangementWithParam:(LDBaseParam *)param
                     success:(void (^)(ArrangementDetailResult *result))success
                     failure:(void (^)(NSError *errro))failure;
@end
