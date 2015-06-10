//
//  LDMessageButton.m
//  邻医家
//
//  Created by Daniel on 15/6/5.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "LDMessageButton.h"

@implementation LDMessageButton
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}
- (void)setHighlighted:(BOOL)highlighted
{
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageWH = 40;
    return CGRectMake(0, 0, imageWH, imageWH);
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(40, 0, contentRect.size.width - 40, contentRect.size.height);
}
- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
//    CGSize titleSize = [title sizeWithFont:self.titleLabel.font];
    CGSize titleSize = [title sizeWithAttributes:@{NSFontAttributeName : self.titleLabel.font}];
    CGRect frame = self.frame;
    frame.size.width = titleSize.width + 40;
    self.frame = frame;
    [super setTitle:title forState:state];
}
@end
