//
//  JobTypeDelegate.m
//  邻医家
//
//  Created by Daniel on 15/7/7.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "JobTypeDelegate.h"

@implementation JobTypeDelegate
- (instancetype)init
{
    if (self = [super init]) {
        Choice *choice1 = [Choice choiceWithName:@"全职" type:1];
        Choice *choice2 = [Choice choiceWithName:@"兼职" type:2];
        Choice *choice3 = [Choice choiceWithName:@"实习/规培" type:3];
        Choice *choice4 = [Choice choiceWithName:@"进修" type:4];
        Choice *choice5 = [Choice choiceWithName:@"博士后" type:5];
        [self.choices addObjectsFromArray:@[choice1,choice2,choice3,choice4,choice5]];
    }
    return self;
}
@end
