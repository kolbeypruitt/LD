//
//  DocArrangementParam.m
//  邻医家
//
//  Created by Daniel on 15/6/12.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "DocArrangementParam.h"

@implementation DocArrangementParam
+ (instancetype)paramWithName:(NSString *)name timePeriod:(NSString *)timePeriod department:(int)department techtitle:(int)techtitle
{
    DocArrangementParam *param = [[DocArrangementParam alloc] init];
    param.name = name;
    param.timePeriod = timePeriod;
    param.department = department;
    param.techtitle = techtitle;
    return param;
}
@end
