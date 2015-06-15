//
//  AllInviteResult.m
//  邻医家
//
//  Created by Daniel on 15/6/15.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "AllInviteResult.h"
#import "MJExtension.h"
#import "Employer.h"
@implementation AllInviteResult
- (NSDictionary *)objectClassInArray
{
    return @{@"employers" : [Employer class]};
}
@end
