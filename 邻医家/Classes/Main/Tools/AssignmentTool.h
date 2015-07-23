//
//  AssignmentTool.h
//  邻医家
//
//  Created by Daniel on 15/7/23.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class LDArrangement;
#import <Foundation/Foundation.h>

@interface AssignmentTool : NSObject
/*
 * 取本地安排
 */
+ (LDArrangement *)arrangement;
/*
 * 存安排到本地
 */
+ (void)saveAssignment:(LDArrangement *)arrangement;
@end
