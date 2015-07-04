//
//  ChatBaseViewController.h
//  邻医家
//
//  Created by SXQ on 15/7/4.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class ChatToolView;
#import <UIKit/UIKit.h>

@interface ChatBaseViewController : UIViewController
@property (nonatomic,weak) UITableView *messageView;
@property (nonatomic,weak) ChatToolView *chatView;
@property (nonatomic,strong) NSMutableArray *messageFrames;
@end
