//
//  MessageCell.h
//  邻医家
//
//  Created by SXQ on 15/7/4.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class MessageFrame;
#import <UIKit/UIKit.h>

@interface MessageCell : UITableViewCell
@property (nonatomic,strong) MessageFrame *messageFrame;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
