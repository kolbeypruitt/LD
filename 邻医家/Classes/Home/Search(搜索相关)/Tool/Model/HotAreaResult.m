//
//  HotAreaResult.m
//  邻医家
//
//  Created by Daniel on 15/6/23.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "MJExtension.h"
#import "HotAreaResult.h"
#import "Location.h"
@implementation HotAreaResult
- (NSDictionary *)objectClassInArray
{
    return @{@"locations" : [Location class]};
}
@end
