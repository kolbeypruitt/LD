//
//  LDMessageCell.h
//  邻医家
//
//  Created by Daniel on 15/7/12.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class LDMessage;
#import <UIKit/UIKit.h>

@interface LDMessageCell : UITableViewCell
@property (nonatomic,strong) LDMessage *message;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
