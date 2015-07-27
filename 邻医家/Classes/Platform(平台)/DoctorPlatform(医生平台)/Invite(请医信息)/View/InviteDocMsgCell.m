//
//  InviteDocMsgCell.m
//  邻医家
//
//  Created by Daniel on 15/6/14.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "InviteDocMessage.h"
#import "InviteDocMsgCell.h"
#import "Common.h"
@interface InviteDocMsgCell ()
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *relpyImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end
@implementation InviteDocMsgCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"invitecell";
    InviteDocMsgCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"InviteDocMsgCell" owner:nil options:nil] lastObject];
    }
    return cell;
}
- (void)awakeFromNib
{
}
- (void)setMessage:(InviteDocMessage *)message
{
    _message = message;
    self.titleLabel.text = message.title;
    self.timeLabel.text = message.time;
    
    NSString *imageName = nil;
    if (message.succeed == 1) {
#warning 换图片
        imageName = @"alreadyReply";
    }else
    {
       imageName = @"notyetReply";
    }
    self.relpyImageView.image = [UIImage imageNamed:imageName];
}
@end
