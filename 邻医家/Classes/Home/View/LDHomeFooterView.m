//
//  LDHomeFooterView.m
//  邻医家
//
//  Created by Daniel on 15/5/4.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "LDHomeFooterView.h"
#import "HomeGroup.h"
#import "FooterBtn.h"
#import "IWCommon.h"
@interface LDHomeFooterView ()
@property (nonatomic,weak) FooterBtn *moreBtn;
@end
@implementation LDHomeFooterView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        FooterBtn *moreBtn = [[FooterBtn alloc] init];
        [moreBtn setImage:[UIImage imageNamed:@"common_icon_arrow"] forState:UIControlStateNormal];
//        [moreBtn setBackgroundColor:IWColor(88, 202, 203)];
        moreBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);
        [moreBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:moreBtn];
        self.moreBtn = moreBtn;
    }
    return self;
}
- (void)setFooterTitle:(NSString *)title
{
    [self.moreBtn setTitle:title forState:UIControlStateNormal];
}
- (void)buttonClicked:(FooterBtn *)button
{
    if ([self.delegate respondsToSelector:@selector(footerView:clickedBtn:)]) {
        [self.delegate footerView:self clickedBtn:button];
    }
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.moreBtn.frame = self.bounds;
}

- (void)setGroup:(HomeGroup *)group
{
    _group = group;
    [self.moreBtn setTitle:group.footer forState:UIControlStateNormal];
}
@end
