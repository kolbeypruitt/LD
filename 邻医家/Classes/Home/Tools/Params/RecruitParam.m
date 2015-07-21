//
//  RecruitParam.m
//  邻医家
//
//  Created by Daniel on 15/6/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "RecruitParam.h"

@implementation RecruitParam
+ (instancetype)paramWithType:(int)type
{
    RecruitParam *param = [[RecruitParam alloc] init];
    param.type = type;
    return  param;
}
+ (instancetype)paramWithType:(int)type andDepartments:(NSString *)departments
{
    RecruitParam *param = [self paramWithType:type];
    param.departments = departments;
    return param;
}
@end
