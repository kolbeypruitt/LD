//
//  MultiInviteDetailController.h
//  邻医家
//
//  Created by Daniel on 15/6/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class EmployInfo;
#import "LDMessageController.h"

@interface MultiInviteDetailController : LDMessageController
@property (nonatomic,strong) EmployInfo *employInfo;
/**
 *1 多点执业，2,专家邀请
 */
@property (nonatomic,assign) int type;
@end
