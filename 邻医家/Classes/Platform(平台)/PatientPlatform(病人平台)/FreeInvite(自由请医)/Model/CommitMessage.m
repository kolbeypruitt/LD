//
//  CommitMessage.m
//  邻医家
//
//  Created by Daniel on 15/7/14.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "CommitMessage.h"

@implementation CommitMessage
+ (instancetype)messageWithStringMsg:(NSString *)stringMsg intMsg:(int)intMsg
{
    CommitMessage *message = [[CommitMessage alloc] init];
    message.stringMsg = stringMsg;
    message.intMsg = intMsg;
    return message;
}
@end
