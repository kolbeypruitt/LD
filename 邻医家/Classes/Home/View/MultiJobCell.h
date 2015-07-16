//
//  MultiJobCellTable.h
//  邻医家
//
//  Created by SXQ on 15/6/24.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class Policy,DoctorStation;
#import <UIKit/UIKit.h>

@interface MultiJobCell : UITableViewCell
@property (nonatomic,strong) Policy *policy;
@property (nonatomic,strong) DoctorStation *doctorStation;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
