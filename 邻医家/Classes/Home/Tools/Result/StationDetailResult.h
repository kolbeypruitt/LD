//
//  StationDetailResult.h
//  邻医家
//
//  Created by Daniel on 15/6/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class DoctorStationDetail;
#import <Foundation/Foundation.h>

@interface StationDetailResult : NSObject
@property (nonatomic,copy) NSString *status;
@property (nonatomic,strong) DoctorStationDetail *postdoctorStation;
@end
