//
//  HospitalEnterParam.m
//  邻医家
//
//  Created by Daniel on 15/5/29.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "HospitalEnterParam.h"

@implementation HospitalEnterParam
+ (instancetype)paramWithHosName:(NSString *)name
                        location:(int)location
                           taxNo:(NSString *)taxNo
                           level:(int)level
                         address:(NSString *)address
                        realname:(NSString *)realname
                        idcardNo:(NSString *)idcardNo
{
    HospitalEnterParam *param = [[HospitalEnterParam alloc] init];
    param.name = name;
    param.location = location;
    param.taxNo = taxNo;
    param.level = level;
    param.address = address;
    param.realname = realname;
    param.idcardNo = idcardNo;
    
    return param;
}
@end
