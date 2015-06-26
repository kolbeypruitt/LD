//
//  DepartmentCell.h
//  邻医家
//
//  Created by Daniel on 15/6/26.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class Department;
#import <UIKit/UIKit.h>

@interface LoginDepartmentCell : UITableViewCell
@property (nonatomic,strong) Department *department;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
