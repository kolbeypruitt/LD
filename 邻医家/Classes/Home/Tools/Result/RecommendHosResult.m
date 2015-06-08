//
//  RecommendHosResult.m
//  邻医家
//
//  Created by Daniel on 15/5/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "RecommendHosResult.h"
#import "MJExtension.h"
@implementation RecommendHosResult
- (NSDictionary *)objectClassInArray
{
    return @{ @"hospitals" : [Hospital class] };
}
@end
