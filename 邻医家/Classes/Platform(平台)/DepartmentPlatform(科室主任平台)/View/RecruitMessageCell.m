//
//  RecruitMessageCell.m
//  邻医家
//
//  Created by Daniel on 15/6/4.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "RecruitMessageCell.h"
#import "RecruitMessage.h"
@interface RecruitMessageCell ()
@property (nonatomic,weak) UILabel *titleLabel;
@property (nonatomic,weak) UILabel *messageLabel;
@end
@implementation RecruitMessageCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    RecruitMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[RecruitMessageCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
         UILabel *titleLabel = [[UILabel alloc] init];
        self.titleLabel = titleLabel;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.textColor = [UIColor blueColor];
        self.titleLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:titleLabel];
        
        UILabel *messageLabel = [[UILabel alloc] init];
        self.messageLabel = messageLabel;
        self.messageLabel.font = [UIFont systemFontOfSize:14];
        self.messageLabel.textColor = [UIColor blackColor];
        self.messageLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:messageLabel];
    }
    return  self;
}
- (void)setMessage:(RecruitMessage *)message
{
    _message = message;
    self.titleLabel.text = message.title;
    self.messageLabel.text = message.detailMessage;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat padding = 10;
    CGFloat cellW = self.frame.size.width;
    CGFloat cellH = self.frame.size.height;
    
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    CGFloat titleW = 60;
    CGFloat titleH = cellH;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    CGFloat messageX = CGRectGetMaxX(self.titleLabel.frame) + padding;
    CGFloat messageY = titleY;
    CGFloat messageW = cellW - messageX;
    CGFloat messageH = titleH;
    self.messageLabel.frame = CGRectMake(messageX, messageY, messageW, messageH);
}
@end








