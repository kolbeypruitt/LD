//
//  CommonCell.h
//  邻医家
//
//  Created by Daniel on 15/5/6.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class ChildView;
#import <UIKit/UIKit.h>

@interface CommonCell : UITableViewCell
@property (nonatomic,strong) NSArray *childs;
- (void)addChildView:(ChildView *)child;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
