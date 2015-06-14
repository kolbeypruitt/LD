//
//  DonConsultCell.h
//  邻医家
//
//  Created by Daniel on 15/6/14.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class ConsultMessage;
#import <UIKit/UIKit.h>

@interface DonConsultCell : UITableViewCell
@property (nonatomic,strong) ConsultMessage *message;
+ (instancetype)cellWithTable:(UITableView *)tableView;
@end
