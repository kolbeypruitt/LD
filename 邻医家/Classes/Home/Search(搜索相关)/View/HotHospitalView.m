//
//  HotHospitalView.m
//  邻医家
//
//  Created by Daniel on 15/6/29.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "UIImage+MJ.h"
#import "Hospital.h"
#import "HotHospitalView.h"
#import "Common.h"
@interface HotHospitalView ()
@property (nonatomic,strong) NSMutableArray *hospitalBtns;
@end
@implementation HotHospitalView
- (void)setHospitals:(NSArray *)hospitals
{
    _hospitals = hospitals;
    [self addHospitalBtn];
}
- (NSMutableArray *)hospitalBtns
{
    if (_hospitalBtns == nil) {
        _hospitalBtns = [NSMutableArray array];
    }
    return _hospitalBtns;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        self.backgroundColor = BGCOLOR;
    }
    return self;
}

- (void)addHospitalBtn
{
    for (int i = 0 ; i < self.hospitals.count; i++) {
        Hospital *hos = self.hospitals[i];
        UIButton *button = [self setupButtonWithTitle:hos.name];
        button.tag = hos.id;
        [button addTarget:self action:@selector(clickedBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.hospitalBtns addObject:button];
    }
}
- (void)clickedBtn:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(hotHospitalView:clieckedBtn:)]) {
        [self.delegate hotHospitalView:self clieckedBtn:button];
    }
}
- (UIButton *)setupButtonWithTitle:(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage resizedImageWithName:@"navigationbar_button_background"] forState:UIControlStateNormal];
    button.titleLabel.numberOfLines = 2;
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    button.titleLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:button];
    return button;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    const int columns = 3;
    const int padding = 10;
    CGFloat buttonW = (SCREENWIDTH - 4 * padding)/columns;
    CGFloat buttonH = 40;
    for ( int i = 0 ; i < self.hospitalBtns.count; i++) {
        int currentColumn = i % columns;
        int currentRow = i / columns;
        CGFloat buttonX = currentColumn * (padding + buttonW) + padding;
        CGFloat buttonY = currentRow *(padding + buttonH) + padding;
        UIButton *button = [self.hospitalBtns objectAtIndex:i];
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
    }
}
@end
