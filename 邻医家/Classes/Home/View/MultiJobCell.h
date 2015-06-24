//
//  MultiJobCellTable.h
//  邻医家
//
//  Created by SXQ on 15/6/24.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class Policy;
#import <UIKit/UIKit.h>

@interface MultiJobCellTable : UITableViewCell
@property (nonatomic,strong) Policy *policy;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
