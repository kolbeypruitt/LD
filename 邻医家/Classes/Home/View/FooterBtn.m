//
//  FooterBtn.m
//  邻医家
//
//  Created by myApple on 15/5/10.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "FooterBtn.h"
#import "UIImage+MJ.h"
@implementation FooterBtn
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        self.titleLabel.textAlignment = NSTextAlignmentRight;
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.imageView.contentMode = UIViewContentModeLeft;
        [self setBackgroundImage:[[UIImage imageWithName:@"common_card_background"] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5)] forState:UIControlStateNormal];
        
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        
    }
    return self;
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX = contentRect.size.width / 2 + 10;
    CGFloat imageY = 0;
    CGFloat imageW = contentRect.size.width/2;
    CGFloat imageH = contentRect.size.height;
    return CGRectMake(imageX, imageY, imageW, imageH);
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    CGFloat titleW = contentRect.size.width/2;
    CGFloat titleH = contentRect.size.height;
    return CGRectMake(titleX, titleY, titleW, titleH);
}
@end

