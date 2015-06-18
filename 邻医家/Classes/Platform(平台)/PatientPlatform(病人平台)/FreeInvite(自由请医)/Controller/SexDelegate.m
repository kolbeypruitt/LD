//
//  SexDelegate.m
//  邻医家
//
//  Created by Daniel on 15/6/18.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "SexDelegate.h"

@implementation SexDelegate
- (instancetype)init
{
    if (self = [super init]) {
        Choice *choice1 = [Choice choiceWithName:@"男" type:1];
        Choice *choice2 = [Choice choiceWithName:@"女" type:2];
        [self.choices addObjectsFromArray:@[choice1,choice2]];
    }
    return self;
}
@end
