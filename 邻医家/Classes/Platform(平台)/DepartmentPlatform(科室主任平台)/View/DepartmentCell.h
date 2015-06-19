//
//  DeparmentCell.h
//  邻医家
//
//  Created by Daniel on 15/6/19.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class ConsultMessage;
#import <UIKit/UIKit.h>

@interface DepartmentCell : UITableViewCell
@property (nonatomic,strong) ConsultMessage *message;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
