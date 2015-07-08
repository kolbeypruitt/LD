//
//  DepartmentListResult.m
//  邻医家
//
//  Created by Daniel on 15/7/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "DepartmentManager.h"
#import "DepartmentListResult.h"
#import "MJExtension.h"
@implementation DepartmentListResult
- (NSDictionary *)objectClassInArray
{
    return @{@"departments" : [DepartmentManager class]};
}
@end
