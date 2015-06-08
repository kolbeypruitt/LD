//
//  DoctorEnterParam.m
//  邻医家
//
//  Created by Daniel on 15/6/3.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "DoctorEnterParam.h"

@implementation DoctorEnterParam
+ (instancetype)paramWithDocname:(NSString *)name idcardNo:(NSString *)idcardNo hospitalName:(NSString *)hospitalName deparment:(int)department hospitalLocation:(int)hospitalLocation hospitalAddress:(NSString *)hospitalAddress hospitalLevel:(int)hospitalLevel techtitle:(int)techtitle introduction:(NSString *)introduction familiarIllness:(NSString *)failiarIllness doctorNO:(NSString *)doctorNo
{
    DoctorEnterParam *param = [[DoctorEnterParam alloc] init];
    param.hospitalName = hospitalName;
    param.department = department;
    param.name = name;
    param.idcardNo  = idcardNo;
    param.hospitalLocation = hospitalLocation;
    param.hospitalAddress =hospitalAddress;
    param.hospitalLevel = hospitalLevel;
    param.techtitle = techtitle;
    param.introduction = introduction;
    param.familiarIllness = failiarIllness;
    param.doctorNo = doctorNo;
    return param;
}
@end
