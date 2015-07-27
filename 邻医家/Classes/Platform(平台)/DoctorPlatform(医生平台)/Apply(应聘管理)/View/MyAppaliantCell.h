//
//  MyAppaliantCell.h
//  邻医家
//
//  Created by Daniel on 15/7/27.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class EmployInfo;
#import <UIKit/UIKit.h>

@interface MyAppaliantCell : UITableViewCell
@property (nonatomic,strong) EmployInfo *empinfo;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
