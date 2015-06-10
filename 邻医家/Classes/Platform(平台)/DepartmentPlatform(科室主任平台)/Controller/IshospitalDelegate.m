//
//  IshospitalDelegate.m
//  邻医家
//
//  Created by Daniel on 15/6/10.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "IshospitalDelegate.h"
@implementation IshospitalDelegate
- (instancetype)init
{
    if (self = [super init]) {
        Choice *choice = [Choice choiceWithName:@"是" type:1];
        Choice *choice2 = [Choice choiceWithName:@"不是" type:2];
        [self.choices addObject:choice];
        [self.choices addObject:choice2];
    }
    return self;
}
@end
