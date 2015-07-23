//
//  LDArrangementParam.m
//  邻医家
//
//  Created by Daniel on 15/7/23.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "LDArrangementParam.h"

@implementation LDArrangementParam
+ (instancetype)paramWithArrangements:(NSString *)arrangements arrangeHospitals:(NSString *)arrangeHospitals
{
    LDArrangementParam *param = [[LDArrangementParam alloc] init];
    param.arrangements = arrangements;
    param.arrangeHospitals = arrangeHospitals;
    return param;
}
@end
