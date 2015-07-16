//
//  ListResult.m
//  邻医家
//
//  Created by Daniel on 15/7/16.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "Doctor.h"
#import "ListResult.h"
#import "MJExtension.h"
@implementation ListResult
- (NSDictionary *)objectClassInArray
{
    return @{@"employers" : [Doctor class]};
}
@end
