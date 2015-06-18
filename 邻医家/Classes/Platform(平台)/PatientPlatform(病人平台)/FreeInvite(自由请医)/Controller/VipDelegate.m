//
//  VipDelegate.m
//  邻医家
//
//  Created by Daniel on 15/6/18.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "VipDelegate.h"

@implementation VipDelegate
- (instancetype)init
{
    if (self = [super init]) {
        Choice *choice1 = [Choice choiceWithName:@"需要" type:1];
        Choice *choice2 = [Choice choiceWithName:@"不需要" type:2];
        [self.choices addObjectsFromArray:@[choice1,choice2]];
    }
    return self;
}
@end
