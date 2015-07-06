//
//  List.m
//  邻医家
//
//  Created by Daniel on 15/7/6.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "List.h"
#import "MJExtension.h"
#import "Employee.h"
@implementation List
- (NSDictionary *)objectClassInArray
{
    return @{@"list" : [Employee class]};
}
@end
