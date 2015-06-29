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
#import "UIBarButtonItem+ENTER.h"
#import "Location.h"
@interface HotAreaView ()
@property (nonatomic,strong) NSMutableArray *cityButtons;
@property (nonatomic,weak) UIButton  *moreCityBtn;
@property (nonatomic,strong) NSMutableArray *cities;
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
        [self addCities];
        [self setupMoreCityBtn];
    }
    return self;
}
- (void)setupMoreCityBtn
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(moreBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage resizedImageWithName:@"navigationbar_button_background"] forState:UIControlStateNormal];
    [button setTitle:@"更多城市" forState:UIControlStateNormal];
    UIColor *titleColor = IWColor(36, 76, 107);
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.titleLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:button];
    self.moreCityBtn = button;
}
- (void)moreBtnClicked:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(hotAreaView:moreBtnClicked:)]) {
        [self.delegate hotAreaView:self moreBtnClicked:button];
    }
   
    
}
- (void)addCities
{
    NSArray *hotCities = @[@"北京",@"上海",@"天津",@"重庆",@"成都",@"广州",@"深圳",@"呼和浩特",@"乌鲁木齐",@"南京",];
    for (int i = 0 ; i < hotCities.count; i++) {
        UIButton *button = [self setupButtonWithTitle:[hotCities objectAtIndex:i]];
        [self.cityButtons addObject:button];
    }
}
- (UIButton *)setupButtonWithTitle:(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(clickedBtn:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage resizedImageWithName:@"navigationbar_button_background"] forState:UIControlStateNormal];
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
    UIButton *lastCity = [self.cityButtons lastObject];
    CGFloat moreX = padding;
    CGFloat moreY = CGRectGetMaxY(lastCity.frame) + padding;
    CGFloat moreW = SCREENWIDTH - 2 * padding;
    CGFloat moreH = buttonH;
    self.moreCityBtn.frame = CGRectMake(moreX, moreY, moreW, moreH);
}
@end
















