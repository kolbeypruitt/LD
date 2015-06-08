//
//  RecommendResult.m
//  邻医家
//
//  Created by Daniel on 15/5/13.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "RecommendResult.h"
#import "MJExtension.h"
#import "Doctor.h"
#import "Hospital.h"
#import "Case.h"
@implementation RecommendResult
- (NSDictionary *)objectClassInArray
{
    return @{@"doctors" : [Doctor class],@"cases" : [Case class] ,@"hospitals" : [Hospital class]};
}
@end
