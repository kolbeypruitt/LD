//
//  PatientEnterParam.m
//  邻医家
//
//  Created by Daniel on 15/6/1.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "PatientEnterParam.h"

@implementation PatientEnterParam
+ (instancetype)paramWithName:(NSString *)name
                     idcardNo:(NSString *)idcardNo
                     location:(int)location
                      address:(NSString *)address
{
    PatientEnterParam *param = [[PatientEnterParam alloc] init];
    param.name = name;
    param.idcardNo = idcardNo;
    param.location = location;
    param.address = address;
    return param;
}
@end
