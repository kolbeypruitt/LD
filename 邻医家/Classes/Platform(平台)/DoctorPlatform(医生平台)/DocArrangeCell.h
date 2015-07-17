//
//  DocArrangeCell.h
//  邻医家
//
//  Created by Daniel on 15/7/17.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class Arrangement;
#import <UIKit/UIKit.h>

@interface DocArrangeCell : UITableViewCell
@property (nonatomic,strong) Arrangement *arrangement;
+ (instancetype)cellWithTabelView:(UITableView *)tableView;
@end
