//
//  MyInviteDetailController.h
//  邻医家
//
//  Created by Daniel on 15/7/12.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class InviteDocMessage;
#import "LDMessageController.h"
@interface MyInviteDetailController : LDMessageController
@property (nonatomic,strong) InviteDocMessage *inviteDocMessage;
@property (nonatomic,strong) NSArray *messages;
@end
