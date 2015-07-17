//
//  DoctorStationDetailController.h
//  邻医家
//
//  Created by Daniel on 15/6/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class DoctorStation;
#import "LDMessageController.h"

@interface DoctorStationDetailController : LDMessageController
@property (nonatomic,strong) DoctorStation *doctorStation;
@end
