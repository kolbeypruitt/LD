//
//  RecruitResult.m
//  邻医家
//
//  Created by Daniel on 15/6/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "RecruitResult.h"
#import "MJExtension.h"
#import "EmployInfo.h"
@implementation RecruitResult
- (NSDictionary *)objectClassInArray
{
    return @{@"employInfos" : [EmployInfo class]};
}
@end
