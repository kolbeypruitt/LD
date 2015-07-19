//
//  LDTextView.m
//  邻医家
//
//  Created by Daniel on 15/5/22.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "LDTextView.h"
@interface LDTextView ()
@property (nonatomic,weak) UILabel *placeholderLabel;
@end
@implementation LDTextView
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}
- (void)setup
{
    UILabel *placeholderLabel = [[UILabel alloc] init];
    placeholderLabel.userInteractionEnabled = NO;
    placeholderLabel.font = [UIFont systemFontOfSize:13];
    placeholderLabel.textColor = [UIColor lightGrayColor];
    placeholderLabel.backgroundColor = [UIColor clearColor];
    self.font = [UIFont systemFontOfSize:16];
    self.placeholderLabel = placeholderLabel;
    [self addSubview:placeholderLabel];
}
- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    self.placeholderLabel.text = placeholder;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.placeholderLabel.frame = CGRectMake(3, 3,self.frame.size.width, 30);
    
}

- (void)showPlaceHolder:(BOOL)show
{
    self.placeholderLabel.hidden = !show;
}
@end
