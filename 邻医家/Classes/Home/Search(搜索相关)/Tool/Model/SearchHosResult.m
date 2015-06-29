//
//  SearchHosResult.m
//  邻医家
//
//  Created by Daniel on 15/6/29.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "SearchHosResult.h"
#import "MJExtension.h"
#import "Hospital.h"
@implementation SearchHosResult
- (NSDictionary *)objectClassInArray
{
    return @{@"hospitals" : [Hospital class]};
}
@end
