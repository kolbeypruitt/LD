//
//  DepartmentManagerCell.h
//  邻医家
//
//  Created by Daniel on 15/7/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class DepartmentManager;
#import <UIKit/UIKit.h>

@interface DepartmentManagerCell : UITableViewCell
@property (nonatomic,strong) DepartmentManager *manager;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
