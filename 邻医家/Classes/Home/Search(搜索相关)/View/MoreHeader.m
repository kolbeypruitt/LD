//
//  MoreHeader.m
//  邻医家
//
//  Created by myApple on 15/5/5.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "MoreGroup.h"
#import "MoreHeader.h"
@interface MoreHeader ()
@property (nonatomic,weak) UILabel *headerTitle;
@end
@implementation MoreHeader
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UILabel *title = [[UILabel alloc] init];
        title.font = [UIFont boldSystemFontOfSize:15];
        title.textColor = [UIColor grayColor];
        title.backgroundColor = [UIColor clearColor];
        [self addSubview:title];
        self.headerTitle = title;
    }
    return self;
}
- (void)setGroup:(MoreGroup *)group
{
    _group = group;
    self.headerTitle.text = group.header;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.headerTitle.frame = self.bounds;
}
@end
