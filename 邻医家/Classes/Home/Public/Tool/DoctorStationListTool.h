//
//  DoctorStationListTool.h
//  邻医家
//
//  Created by Daniel on 15/6/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class StationListResult;
#import <Foundation/Foundation.h>

@interface DoctorStationListTool : NSObject
+ (void)doctorStationListSuccess:(void (^)(StationListResult *result))success
                         failure:(void (^)(NSError *error))failure;
@end
