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
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UILabel *placeholderLabel = [[UILabel alloc] init];
        placeholderLabel.userInteractionEnabled = NO;
        placeholderLabel.font = [UIFont systemFontOfSize:13];
        placeholderLabel.textColor = [UIColor lightGrayColor];
        placeholderLabel.backgroundColor = [UIColor clearColor];
        self.placeholderLabel = placeholderLabel;
        [self addSubview:placeholderLabel];
    }
    return self;
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
