//
//  HosRankResult.m
//  邻医家
//
//  Created by Daniel on 15/5/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "HosRankResult.h"
#import "MJExtension.h"
@implementation HosRankResult
- (NSDictionary *)objectClassInArray
{
    return @{@"levels" : [HosRank class]};
}
@end
