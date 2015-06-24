//
//  DoctorDetailParam.m
//  邻医家
//
//  Created by Daniel on 15/6/24.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "DoctorDetailParam.h"

@implementation DoctorDetailParam
+ (instancetype)paramWithId:(int)Id
{
    DoctorDetailParam *param = [[DoctorDetailParam alloc] init];
    param.id = Id;
    return param;
}
@end
