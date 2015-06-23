//
//  HotAreaView.m
//  邻医家
//
//  Created by Daniel on 15/6/23.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "Common.h"
#import "UIImage+MJ.h"
#import "HotAreaView.h"
#import "Location.h"
@interface HotAreaView ()
@property (nonatomic,strong) NSMutableArray *cityButtons;
@end
@implementation HotAreaView
- (NSMutableArray *)cityButtons
{
    if (_cityButtons == nil) {
        _cityButtons = [NSMutableArray array];
    }
    return _cityButtons;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
    }
    return self;
}
- (void)addCities
{
    for (int i = 0 ; i < self.locations.count; i++) {
        Location *loca = [self.locations objectAtIndex:i];
        UIButton *button = [self setupButtonWithTitle:[loca name]];
        button.tag = [loca id];
        [self.cityButtons addObject:button];
    }
}
- (void)setLocations:(NSArray *)locations
{
    _locations = locations;
    [self addCities];
}
- (UIButton *)setupButtonWithTitle:(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(clickedBtn:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage resizedImageWithName:@"common_card_background"] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor greenColor]];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.titleLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:button];
    return button;
}
- (void)clickedBtn:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(hotAreaView:sender:)]) {
        [self.delegate hotAreaView:self sender:button];
    }
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    const int columns = 3;
    const int padding = 10;
    CGFloat buttonW = (SCREENWIDTH - 4 * padding)/columns;
    CGFloat buttonH = 30;
    for ( int i = 0 ; i < self.cityButtons.count; i++) {
        int currentColumn = i % columns;
        int currentRow = i / columns ;
        CGFloat buttonX = currentColumn * (padding + buttonW) + padding;
        CGFloat buttonY = currentRow *(padding + buttonH) + padding;
        UIButton *button = [self.cityButtons objectAtIndex:i];
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
    }
}
@end
















