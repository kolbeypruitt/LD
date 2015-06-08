//
//  DiseaseCell.h
//  邻医家
//
//  Created by Daniel on 15/5/6.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class Case;
#import <UIKit/UIKit.h>

@interface DiseaseCell : UITableViewCell
@property (nonatomic,strong) Case *commonCase;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
