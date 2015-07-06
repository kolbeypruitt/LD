//
//  GetEmployeeResult.m
//  邻医家
//
//  Created by Daniel on 15/6/11.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "GetEmployeeResult.h"
#import "MJExtension.h"
#import "List.h"
@implementation GetEmployeeResult
- (NSDictionary *)objectClassInArray
{
    return @{@"employs" : [List class]};
}
@end
