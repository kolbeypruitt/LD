//
//  FreeDetailMsgParam.m
//  邻医家
//
//  Created by Daniel on 15/6/14.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "FreeDetailMsgParam.h"

@implementation FreeDetailMsgParam
+ (instancetype)paramWithId:(int)Id
{
    FreeDetailMsgParam *param = [[FreeDetailMsgParam alloc] init];
    param.id = Id;
    return param;
}
@end
