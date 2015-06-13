//
//  DoctorConsultListParam.m
//  邻医家
//
//  Created by Daniel on 15/6/13.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "DoctorConsultListParam.h"

@implementation DoctorConsultListParam
+ (instancetype)paramWithType:(int)type
{
    DoctorConsultListParam *param = [[DoctorConsultListParam alloc] init];
    param.type = type;
    return param;
}
@end
