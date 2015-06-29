//
//  CoreExpertResult.m
//  邻医家
//
//  Created by Daniel on 15/6/29.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "MJExtension.h"
#import "CoreExpertResult.h"
#import "Doctor.h"
@implementation CoreExpertResult
- (NSDictionary *)objectClassInArray
{
    return @{@"doctors" : [Doctor class]};
}
@end
