//
//  MessageFrame.m
//  邻医家
//
//  Created by SXQ on 15/7/4.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "NSString+Extension.h"
#import "MessageFrame.h"
#import "UCSCommonClass.h"
#import "Account.h"
#import "AccountTool.h"
@interface MessageFrame ()
@property (nonatomic,strong) Account *account;
@end
@implementation MessageFrame
- (Account *)account
{
    if (_account == nil) {
        _account = [AccountTool account];
    }
    return _account;
}
- (void)setMessage:(UCSMessage *)message
{
    _message = message;
    // 间距
    CGFloat padding = 10;
    // 屏幕的宽度
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    
    // 2.头像
    CGFloat iconY = padding;
    CGFloat iconW = 40;
    CGFloat iconH = 40;
    CGFloat iconX;
    if ([message.msgFromUid isEqualToString:self.account.clientNumber]) { // 自己的发的
        iconX = screenW - padding - iconW;
    }else // 别人发的
    {
        iconX = padding;
    }
    _iconF = CGRectMake(iconX, iconY, iconW, iconH);
    
    // 3.正文
    CGFloat textY = iconY;
    // 文字计算的最大尺寸
    CGSize textMaxSize = CGSizeMake(200, MAXFLOAT);
    // 文字计算出来的真实尺寸(按钮内部label的尺寸)
    CGSize textRealSize = [message.msgContent sizeWithFont:MJTextFont maxSize:textMaxSize];
    // 按钮最终的真实尺寸
    CGSize textBtnSize = CGSizeMake(textRealSize.width + MJTextPadding * 2, textRealSize.height + MJTextPadding * 2);
    CGFloat textX;
    
    if ([message.msgFromUid isEqualToString:self.account.clientNumber]) { // 自己的发的
        textX = iconX - padding - textBtnSize.width;
    }else // 别人发的
    {
        textX = CGRectGetMaxX(_iconF) + padding;
    }
    _textF = (CGRect){{textX, textY}, textBtnSize};
    
    // 4.cell的高度
    CGFloat textMaxY = CGRectGetMaxY(_textF);
    CGFloat iconMaxY = CGRectGetMaxY(_iconF);
    _cellHeight = MAX(textMaxY, iconMaxY) + padding;
}
@end
