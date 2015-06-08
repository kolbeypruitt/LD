//
//  ChildView.m
//  邻医家
//
//  Created by Daniel on 15/5/6.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "ChildView.h"
#import "ChildItem.h"
@interface ChildView ()
@property (nonatomic,weak) UILabel *titleLabel;
@end
@implementation ChildView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:titleLabel];
        self.titleLabel = titleLabel;
    }
    return self;
}
- (void)setItem:(ChildItem *)item
{
    _item = item;
    
    self.titleLabel.text = item.title;
}
- (void)setFrame:(CGRect)frame
{
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.titleLabel.frame = self.frame;
}
@end
