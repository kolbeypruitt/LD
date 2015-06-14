//
//  InfoListResult.m
//  邻医家
//
//  Created by Daniel on 15/6/14.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "MJExtension.h"
#import "InfoListResult.h"
#import "InviteDocMessage.h"

@implementation InfoListResult
- (NSDictionary *)objectClassInArray
{
    return @{@"seekDoctor" : [InviteDocMessage class]};
}
@end
