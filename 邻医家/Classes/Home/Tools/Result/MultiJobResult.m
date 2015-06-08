//
//  MultiJobResult.m
//  邻医家
//
//  Created by Daniel on 15/5/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "MultiJobResult.h"
#import "MJExtension.h"
#import "Policy.h"
@implementation MultiJobResult
- (NSDictionary *)objectClassInArray
{
    return @{@"policys" : [Policy class]};
}
@end
