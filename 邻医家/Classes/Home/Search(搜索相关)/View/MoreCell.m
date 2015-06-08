//
//  MoreCell.m
//  邻医家
//
//  Created by myApple on 15/5/5.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "MoreItem.h"
#import "MoreCell.h"
#import "IWCommon.h"
#import "UIImage+MJ.h"
@interface MoreCell ()
@property (nonatomic,weak) UIButton *nameBtn;
@end
@implementation MoreCell
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        UIButton *nameButton = [[UIButton alloc] init];
        nameButton.titleLabel.numberOfLines = 0;
        nameButton.titleLabel.font = [UIFont systemFontOfSize:13];
        nameButton.titleLabel.backgroundColor = [UIColor clearColor];
        nameButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [nameButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self.contentView addSubview:nameButton];
        [nameButton addTarget:self action:@selector(clickedBtn:) forControlEvents:UIControlEventTouchUpInside];
        [nameButton setBackgroundImage:[UIImage resizedImageWithName:@"common_card_background"] forState:UIControlStateNormal];
        self.nameBtn = nameButton;
    }
    return self;
}
- (void)clickedBtn:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(moreCell:didClickedBtn:)]) {
        [self.delegate moreCell:self didClickedBtn:button];
    }
}
- (void)setItem:(MoreItem *)item
{
    _item = item;
    [self.nameBtn setTitle:item.title forState:UIControlStateNormal];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.nameBtn.frame = self.bounds;
}
@end
