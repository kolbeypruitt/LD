//
//  RecommendDocResult.m
//  邻医家
//
//  Created by Daniel on 15/5/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "RecommendDocResult.h"
#import "MJExtension.h"
@implementation RecommendDocResult
- (NSDictionary *)objectClassInArray
{
    return @{@"doctors" : [Doctor class] };
}
@end
