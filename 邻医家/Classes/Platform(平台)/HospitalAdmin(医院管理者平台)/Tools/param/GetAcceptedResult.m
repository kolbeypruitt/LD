//
//  GetAcceptedResult.m
//  邻医家
//
//  Created by Daniel on 15/6/11.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "Employer.h"
#import "GetAcceptedResult.h"
#import "MJExtension.h"
@implementation GetAcceptedResult
- (NSDictionary *)objectClassInArray
{
    return @{@"employers" : [Employer class]};
}
@end
