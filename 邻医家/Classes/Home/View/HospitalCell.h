//
//  HospitalCell.h
//  邻医家
//
//  Created by Daniel on 15/5/6.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

@class Hospital;
#import <UIKit/UIKit.h>

@interface HospitalCell : UITableViewCell
@property (nonatomic,strong) Hospital *hospital;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
