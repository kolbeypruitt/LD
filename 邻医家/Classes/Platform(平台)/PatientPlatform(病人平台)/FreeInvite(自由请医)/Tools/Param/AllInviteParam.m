//
//  AllInviteParam.m
//  邻医家
//
//  Created by Daniel on 15/6/15.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "AllInviteParam.h"

@implementation AllInviteParam
+ (instancetype)paramWithId:(int)ID
{
    AllInviteParam *param = [[AllInviteParam alloc] init];
    param.id = ID;
    return param;
}
@end
