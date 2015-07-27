//
//  PatientInviteDocCell.h
//  邻医家
//
//  Created by Daniel on 15/7/27.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class InviteDocMessage;
#import <UIKit/UIKit.h>

@interface PatientInviteDocCell : UITableViewCell
@property (nonatomic,strong) InviteDocMessage *message;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
