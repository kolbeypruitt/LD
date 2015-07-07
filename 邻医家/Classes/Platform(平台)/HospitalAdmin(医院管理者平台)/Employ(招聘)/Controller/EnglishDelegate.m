//
//  EnglishDelegate.m
//  邻医家
//
//  Created by Daniel on 15/7/7.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "EnglishDelegate.h"

@implementation EnglishDelegate
- (instancetype)init
{
    if (self = [super init]) {
        Choice *choice1 = [Choice choiceWithName:@"不限" type:1];
        Choice *choice2 = [Choice choiceWithName:@"英语六级" type:2];
        Choice *choice3 = [Choice choiceWithName:@"英语四级" type:3];
        [self.choices addObjectsFromArray:@[choice1,choice2,choice3]];
    }
    return self;
}
@end
