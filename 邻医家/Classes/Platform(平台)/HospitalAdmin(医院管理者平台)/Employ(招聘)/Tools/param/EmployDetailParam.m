// //  EmployDetailParam.m
//  邻医家
//
//  Created by Daniel on 15/6/11.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "EmployDetailParam.h"

@implementation EmployDetailParam
+ (instancetype)paramWithId:(int)ID
{
    EmployDetailParam *param = [[EmployDetailParam alloc] init];
    param.id = ID;
    return param;
}
@end
