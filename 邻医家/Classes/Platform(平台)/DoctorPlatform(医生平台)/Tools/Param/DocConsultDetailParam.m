//
//  DocConsultDetailParam.m
//  邻医家
//
//  Created by Daniel on 15/6/13.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "DocConsultDetailParam.h"

@implementation DocConsultDetailParam
+ (instancetype)paramWithId:(int)ID
{
    DocConsultDetailParam *param = [[DocConsultDetailParam alloc] init];
    param.id = ID;
    return param;
}
@end
