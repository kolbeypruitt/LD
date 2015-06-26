//
//  LoginDocDetailResult.m
//  邻医家
//
//  Created by Daniel on 15/6/26.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "MJExtension.h"
#import "LoginDocDetailResult.h"
#import "Case.h"
#import "LDPaper.h"
@implementation LoginDocDetailResult
- (NSDictionary *)objectClassInArray
{
    return @{@"cases" : [Case class],@"papers" : [LDPaper class]};
}
@end
