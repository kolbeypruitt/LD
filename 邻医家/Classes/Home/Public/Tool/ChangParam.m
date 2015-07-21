//
//  ChangParam.m
//  邻医家
//
//  Created by Daniel on 15/7/21.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "ChangParam.h"

@implementation ChangParam
+ (instancetype)paraWithTelnum:(NSString *)telnum code:(NSString *)code password:(NSString *)password
{
    ChangParam *param = [[ChangParam alloc] init];
    param.telnum = telnum;
    param.code = code;
    param.password = password;
    return param;
}
@end
