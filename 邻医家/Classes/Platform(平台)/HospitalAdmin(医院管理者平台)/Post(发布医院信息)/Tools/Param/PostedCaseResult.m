//
//  PostedCaseResult.m
//  邻医家
//
//  Created by Daniel on 15/7/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "PostedCaseResult.h"
#import "MJExtension.h"
#import "Case.h"
@implementation PostedCaseResult
- (NSDictionary *)objectClassInArray
{
    return @{@"cases" :[Case class]};
}
@end
