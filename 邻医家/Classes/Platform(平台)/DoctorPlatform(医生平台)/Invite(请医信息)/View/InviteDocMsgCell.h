//
//  InviteDocMsgCell.h
//  邻医家
//
//  Created by Daniel on 15/6/14.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class InviteDocMessage;
#import <UIKit/UIKit.h>

@interface InviteDocMsgCell : UITableViewCell
@property (nonatomic,strong) InviteDocMessage *message;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
