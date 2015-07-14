//
//  LDInputMessage.m
//  邻医家
//
//  Created by Daniel on 15/7/14.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "LDInputMessage.h"

@implementation LDInputMessage
+ (instancetype)messageWithFirstTitle:(NSString *)firsteTitle placeHolder:(NSString *)placeholder optionDelegate:(id)delegate
{
    LDInputMessage *message = [[LDInputMessage alloc] init];
    message.firstTitle = firsteTitle;
    message.placeHolder = placeholder;
    message.optionDelegate = delegate;
    return message;
}
@end
