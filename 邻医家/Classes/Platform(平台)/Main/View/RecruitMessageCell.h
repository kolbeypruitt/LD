//
//  RecruitMessageCell.h
//  邻医家
//
//  Created by Daniel on 15/6/4.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class RecruitMessage;
#import <UIKit/UIKit.h>

@interface RecruitMessageCell : UITableViewCell
@property (nonatomic,strong) RecruitMessage *message;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
