//
//  ResumeCell.h
//  邻医家
//
//  Created by Daniel on 15/6/11.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class Employer;
#import <UIKit/UIKit.h>

@interface ResumeCell : UITableViewCell
@property (nonatomic,strong) Employer *employer;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
