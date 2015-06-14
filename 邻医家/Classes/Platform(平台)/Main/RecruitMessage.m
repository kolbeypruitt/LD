//
//  RecruitMessage.m
//  邻医家
//
//  Created by Daniel on 15/6/4.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "RecruitMessage.h"

@implementation RecruitMessage
+ (instancetype)messageWithTitle:(NSString *)title detailMessage:(NSString *)detail
{
    RecruitMessage *message = [[RecruitMessage alloc] init];
    message.title = title;
    message.detailMessage = detail;
    return message;
}
@end
