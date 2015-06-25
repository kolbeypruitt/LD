//
//  MultiInviteCell.h
//  邻医家
//
//  Created by Daniel on 15/6/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class EmployInfo;
#import <UIKit/UIKit.h>

@interface MultiInviteCell : UITableViewCell
@property (nonatomic,strong) EmployInfo *employInfo;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
