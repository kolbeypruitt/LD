//
//  MessageCell.m
//  邻医家
//
//  Created by SXQ on 15/7/4.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "UIImage+MJ.h"
#import "UCSCommonClass.h"
#import "MessageFrame.h"
#import "Account.h"
#import "AccountTool.h"
#import "MessageCell.h"

// NSString             *msgFromUid;     // 消息发送者UID
// NSString             *msgToUid;       // 消息接收者UID
// NSString             *msgContent;     // 消息内容（当为附件类型时，值为路径）
// int             msgContentType;       // 消息类型（1文本，2图片，3语音，4视频，10-29自定义）
// NSString             *msgRecordID;    // 消息唯一标识
// NSString             *msgCreTime;     // 消息创建时间
// NSString             *msgFileName;     // 附件原始名称
// NSString             *msgFileSize;     // 附件大小，单位为K
@interface MessageCell ()
@property (nonatomic,strong) Account *accont;
@property (nonatomic,weak) UIButton  *textView;
@property (nonatomic,weak) UIImageView *iconView;
@end
@implementation MessageCell
- (Account *)accont
{
    if (_accont == nil) {
        _accont = [AccountTool account];
    }
    return _accont;
}
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"message";
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //icon
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        
        //textview
        UIButton *textView = [[UIButton alloc] init];
        textView.titleLabel.numberOfLines = 0;
        [textView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        textView.titleLabel.font = [UIFont systemFontOfSize:13];
        textView.contentEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20);
        [self.contentView addSubview:textView];
        self.textView = textView;
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (void)setMessageFrame:(MessageFrame *)messageFrame
{
    _messageFrame = messageFrame;
    UCSMessage *message = messageFrame.message;
    
    // 2.头像
    NSString *icon = (message.msgToUid != self.accont.clientNumber) ? @"me" : @"other";
    self.iconView.image = [UIImage imageNamed:icon];
    self.iconView.frame = messageFrame.iconF;
    
    // 3.正文
    [self.textView setTitle:message.msgContent forState:UIControlStateNormal];
    self.textView.frame = messageFrame.textF;
    
    // 4.正文的背景
    if (message.msgToUid != self.accont.clientNumber) { // 自己发的,蓝色
        [self.textView setBackgroundImage:[UIImage resizedImageWithName:@"chat_send_nor"] forState:UIControlStateNormal];
    } else { // 别人发的,白色
        [self.textView setBackgroundImage:[UIImage resizedImageWithName:@"chat_recive_nor"] forState:UIControlStateNormal];
    }
}
@end







