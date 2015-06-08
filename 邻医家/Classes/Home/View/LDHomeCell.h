//
//  LDHomeCell.h
//  邻医家
//
//  Created by Daniel on 15/5/4.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class HomeItem;
#import <UIKit/UIKit.h>

@interface LDHomeCell : UITableViewCell
@property (nonatomic,strong) HomeItem *item;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
