//
//  AssignmentTool.m
//  邻医家
//
//  Created by Daniel on 15/7/23.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDArrangement.h"
#import "AssignmentTool.h"
#define ARRANGEMENTFILE ([[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"arrangement.data"])

@implementation AssignmentTool
+ (void)saveAssignment:(LDArrangement *)arrangement
{
    [NSKeyedArchiver archiveRootObject:arrangement toFile:ARRANGEMENTFILE];
}
+ (LDArrangement *)arrangement
{
    LDArrangement *arrangement = [NSKeyedUnarchiver unarchiveObjectWithFile:ARRANGEMENTFILE];
    return arrangement;
}
@end
