//
//  StationDetailTool.h
//  邻医家
//
//  Created by Daniel on 15/6/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class CaseDetailParam,StationDetailResult;
#import <Foundation/Foundation.h>

@interface StationDetailTool : NSObject
+ (void)stationDetailWithParam:(CaseDetailParam *)param
                       success:(void (^)(StationDetailResult *result))success
                       failure:(void (^)(NSError *error))failure;
@end
