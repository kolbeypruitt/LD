//
//  HotDepartmentResult.m
//  邻医家
//
//  Created by Daniel on 15/6/29.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "MJExtension.h"
#import "HotDepartmentResult.h"
#import "Department.h"
@implementation HotDepartmentResult
- (NSDictionary *)objectClassInArray
{
    return @{@"departments" : [Department class]};
}
@end
