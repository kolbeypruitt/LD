//
//  NiyaoDelegate.m
//  邻医家
//
//  Created by Daniel on 15/6/10.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "NiyaoDelegate.h"
@implementation NiyaoDelegate
- (instancetype)init
{
    if (self = [super init]) {
        Choice *choice2 = [Choice choiceWithName:@"主治" type:2];
        Choice *choice3 = [Choice choiceWithName:@"副高" type:3];
        Choice *choice4 = [Choice choiceWithName:@"正高" type:4];
        Choice *choice5 = [Choice choiceWithName:@"不限" type:5];
        [self.choices addObjectsFromArray:@[choice2,choice3,choice4,choice5]];
    }
    return self;
}
@end
