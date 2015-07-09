//
//  ArrangementCell.h
//  邻医家
//
//  Created by Daniel on 15/7/9.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class Arrangement;
#import <UIKit/UIKit.h>

@interface ArrangementCell : UITableViewCell
@property (nonatomic,strong) Arrangement *arrangement;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
