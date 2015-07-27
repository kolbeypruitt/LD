//
//  DonConsultCell.m
//  邻医家
//
//  Created by Daniel on 15/6/14.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "ConsultMessage.h"
#import "DonConsultCell.h"
@interface DonConsultCell ()
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *replyImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end
@implementation DonConsultCell
+ (instancetype)cellWithTable:(UITableView *)tableView
{
    static NSString *ID = @"doncell";
    DonConsultCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"DonConsultCell" owner:nil options:nil] lastObject];
    }
    return cell;
}
- (void)setMessage:(ConsultMessage *)message
{
    _message = message;
    self.titleLabel.text = message.title;
    self.timeLabel.text = message.createTime;
   
}

@end
