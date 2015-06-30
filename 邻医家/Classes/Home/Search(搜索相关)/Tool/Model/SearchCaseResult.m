//
//  SearchCaseResult.m
//  邻医家
//
//  Created by Daniel on 15/6/30.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "Case.h"
#import "SearchCaseResult.h"
#import "MJExtension.h"
@implementation SearchCaseResult
- (NSDictionary *)objectClassInArray
{
    return @{@"cases" : [Case class]};
}
@end
