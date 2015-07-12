//
//  LDMessage.m
//  邻医家
//
//  Created by Daniel on 15/7/12.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "LDMessage.h"

@implementation LDMessage
+ (instancetype)messageWithFirstTitle:(NSString *)firstTitle secondTitle:(NSString *)secondTitle
{
    LDMessage *message = [[LDMessage alloc] init];
    message.firstTitle = firstTitle;
    message.secondTitle = secondTitle;
    return message;
}
@end
