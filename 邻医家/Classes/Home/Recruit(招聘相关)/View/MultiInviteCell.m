//
//  MultiInviteCell.m
//  邻医家
//
//  Created by Daniel on 15/6/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "MultiInviteCell.h"
#import "EmployInfo.h"
@interface MultiInviteCell ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;

@end
@implementation MultiInviteCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"recruitcell";
    MultiInviteCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MultiInviteCell" owner:nil options:nil] lastObject];
    }
    return cell;
}
- (void)setEmployInfo:(EmployInfo *)employInfo
{
    _employInfo = employInfo;
    self.nameLabel.text = employInfo.name;
    self.timeLabel.text = employInfo.startdate;
    self.locationLabel.text = employInfo.city;
}
@end
