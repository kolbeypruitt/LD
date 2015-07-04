//
//  ChatToolView.m
//  邻医家
//
//  Created by SXQ on 15/7/4.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "ChatToolView.h"
@interface ChatToolView ()

@end
@implementation ChatToolView

+ (instancetype)chatToolView
{
    ChatToolView *chatView = [[[NSBundle mainBundle] loadNibNamed:@"ChatToolView" owner:nil options:nil] lastObject];
    return chatView;
}

@end
