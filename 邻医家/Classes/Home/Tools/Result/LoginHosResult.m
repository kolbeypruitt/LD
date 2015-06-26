//
//  LoginHosResult.m
//  邻医家
//
//  Created by Daniel on 15/6/26.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "Doctor.h"
#import "LoginHosResult.h"
#import "MJExtension.h"
#import "Department.h"
#import "Case.h"
@implementation LoginHosResult
- (NSDictionary *)objectClassInArray
{
    return @{@"doctors" : [Doctor class],@"departments": [Department class] ,@"cases" : [Case class]};
}
@end
