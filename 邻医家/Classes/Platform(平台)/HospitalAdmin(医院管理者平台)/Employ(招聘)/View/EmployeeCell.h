//
//  EmployeeCell.h
//  邻医家
//
//  Created by Daniel on 15/6/11.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class Employee;
#import <UIKit/UIKit.h>

@interface EmployeeCell : UITableViewCell
@property (nonatomic,strong) Employee *emp;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end

