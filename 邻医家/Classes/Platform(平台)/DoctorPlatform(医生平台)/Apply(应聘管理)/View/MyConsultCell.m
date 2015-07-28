//
//  MyConsultCell.m
//  邻医家
//
//  Created by Daniel on 15/7/28.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "MyConsultCell.h"
#import "ConsultMessage.h"
@interface MyConsultCell ()
@property (nonatomic,weak) IBOutlet UILabel *nameLabel;
@property (nonatomic,weak) IBOutlet UILabel *timeLabel;
@property (nonatomic,weak) IBOutlet UIImageView *replyImageView;
@end
@implementation MyConsultCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"myconsultcell";
    MyConsultCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MyConsultCell" owner:nil options:nil] lastObject];
    }
    return cell;
}
- (void)setMessage:(ConsultMessage *)message
{
    _message = message;
    self.nameLabel.text = message.title;
    self.timeLabel.text = message.createTime;
    NSString *imageName = nil;
    if (message.succeed == 1) {//已录取
        imageName = @"enroll2";
    }else
    {
        imageName = @"unenroll2";
    }
    self.replyImageView.image = [UIImage imageNamed:imageName];
}
@end
