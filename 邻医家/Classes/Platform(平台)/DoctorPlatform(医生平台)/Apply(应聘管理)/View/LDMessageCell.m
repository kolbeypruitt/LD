//
//  LDMessageCell.m
//  邻医家
//
//  Created by Daniel on 15/7/12.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDMessage.h"
#import "LDMessageCell.h"
#import "LDMessageLabel.h"
@interface LDMessageCell ()
@property (nonatomic,weak) LDMessageLabel *messageLabel;
@end
@implementation LDMessageCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"ldmessagecell";
    LDMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[LDMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupCustomViews];
    }
    return self;
}
- (void)setupCustomViews
{
    LDMessageLabel *messageLabel = [[LDMessageLabel alloc] init];
    [self.contentView addSubview:messageLabel];
    self.messageLabel = messageLabel;
}
- (void)setSingleLine:(BOOL)singleLine
{
    _singleLine = singleLine;
    self.messageLabel.singleLine = singleLine;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.messageLabel.frame = self.bounds;
}
- (void)setMessage:(LDMessage *)message
{
    _message = message;
    self.messageLabel.firstLabel.text = message.firstTitle;
    self.messageLabel.secondLabel.text = message.secondTitle;
}
- (void)setFrame:(CGRect)frame
{
    frame.origin.y += 10;
    frame.size.height -= 10;
    [super setFrame:frame];
}
@end
