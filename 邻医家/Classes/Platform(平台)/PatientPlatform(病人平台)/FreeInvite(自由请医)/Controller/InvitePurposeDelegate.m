//
//  InvitePurposeDelegate.m
//  邻医家
//
//  Created by Daniel on 15/6/18.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "InvitePurposeDelegate.h"

@implementation InvitePurposeDelegate
- (instancetype)init
{
    if (self = [super init]) {
        Choice *choice1 = [Choice choiceWithName:@"住院手术" type:1];
        Choice *choice2 = [Choice choiceWithName:@"住院不手术" type:2];
        Choice *choice3 = [Choice choiceWithName:@"不住院" type:3];
        Choice *choice4 = [Choice choiceWithName:@"不限" type:4];
        [self.choices addObjectsFromArray:@[choice1,choice2,choice3,choice4]];
    }
    return self;
}
@end
