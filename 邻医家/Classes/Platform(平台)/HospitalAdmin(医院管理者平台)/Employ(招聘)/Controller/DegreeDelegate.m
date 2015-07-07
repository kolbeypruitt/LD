//
//  DegreeDelegate.m
//  邻医家
//
//  Created by Daniel on 15/7/7.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "DegreeDelegate.h"

@implementation DegreeDelegate
- (instancetype)init
{
    if (self = [super init]) {
        Choice *choice1 = [Choice choiceWithName:@"不限" type:1];
        Choice *choice2 = [Choice choiceWithName:@"博士后" type:2];
        Choice *choice3 = [Choice choiceWithName:@"博士" type:3];
        Choice *choice4 = [Choice choiceWithName:@"硕士" type:4];
        Choice *choice5 = [Choice choiceWithName:@"本科" type:5];
        Choice *choice6 = [Choice choiceWithName:@"大专" type:6];
        [self.choices addObjectsFromArray:@[choice1,choice2,choice3,choice4,choice5,choice6]];
    }
    return self;
}
@end
