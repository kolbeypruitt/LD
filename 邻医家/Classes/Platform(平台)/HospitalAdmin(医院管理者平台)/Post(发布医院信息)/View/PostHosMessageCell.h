//
//  PostHosMessageCell.h
//  邻医家
//
//  Created by SXQ on 15/7/27.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostHosMessageCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *messageTitle;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
