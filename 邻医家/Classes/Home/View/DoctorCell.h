//
//  DoctorCell.h
//  邻医家
//
//  Created by Daniel on 15/5/6.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class Doctor;
#import <UIKit/UIKit.h>

@interface DoctorCell : UITableViewCell
@property (nonatomic,strong) Doctor *doctor;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
