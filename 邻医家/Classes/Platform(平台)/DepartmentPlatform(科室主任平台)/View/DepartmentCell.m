//
//  DeparmentCell.m
//  邻医家
//
//  Created by Daniel on 15/6/19.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "DepartmentCell.h"
#import "ConsultMessage.h"
@interface DepartmentCell ()
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end
@implementation DepartmentCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    DepartmentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"deparmentcell"];
    if (cell == nil ) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"DepartmentCell" owner:nil options:nil] lastObject];
    }
    return cell;
}
- (void)setMessage:(ConsultMessage *)message
{
    _message = message;
    self.titleLabel.text = message.title;
    self.timeLabel.text = message.createTime;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
