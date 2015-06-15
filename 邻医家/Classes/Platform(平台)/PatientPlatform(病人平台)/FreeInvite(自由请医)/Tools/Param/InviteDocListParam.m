//
//  InviteDocListParam.m
//  邻医家
//
//  Created by Daniel on 15/6/15.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "InviteDocListParam.h"

@implementation InviteDocListParam
+ (instancetype)paramWithType:(int)type
{
    InviteDocListParam *param = [[InviteDocListParam alloc] init];
    param.type = type;
    return param;
}
@end
