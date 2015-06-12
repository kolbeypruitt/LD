//
//  HospitalInfoParam.m
//  邻医家
//
//  Created by Daniel on 15/6/12.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "HospitalInfoParam.h"

@implementation HospitalInfoParam
+ (instancetype)paramWithName:(NSString *)name website:(NSString *)website
{
    HospitalInfoParam *param =[[HospitalInfoParam alloc]  init];
    param.name = name;
    param.website = website;
    return param;
}
@end
