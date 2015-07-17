//
//  LDEnterCell.h
//  邻医家
//
//  Created by Daniel on 15/7/17.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LDEnterCell : UITableViewCell
@property (nonatomic,copy) NSString *imageName;
+ (instancetype)cellWithTabelView:(UITableView *)tableView;
@end
