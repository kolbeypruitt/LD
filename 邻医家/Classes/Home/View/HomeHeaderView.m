//
//  HomeHeaderView.m
//  邻医家
//
//  Created by Daniel on 15/4/29.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#define BUTTONBORDER 20
#define BUTTONCOUNT 3
#import "HomeHeaderView.h"
#import "UIImage+MJ.h"
@interface HomeHeaderView ()
@property (nonatomic,strong) NSMutableArray *btns;
@property (nonatomic,weak) UIButton *findByHospital;
@property (nonatomic,weak) UIButton *findByDisease;
@property (nonatomic,weak) UIButton *nearHospital;
@end

@implementation HomeHeaderView
- (NSMutableArray *)btns
{
    if (_btns == nil) {
        _btns = [NSMutableArray array];
    }
    return _btns;
}
+ (HomeHeaderView *)hederView
{
    return [[self alloc] init];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage resizedImageWithName:@"background_white_04"];
        self.userInteractionEnabled = YES;
        
        UIButton *findByhostpital = [[UIButton alloc] init];
        NSString *name = [NSString stringWithFormat:@"icon_index_hospital"];
        [findByhostpital setImage:[UIImage imageWithName:name] forState:UIControlStateNormal];
        [self addSubview:findByhostpital];
        [findByhostpital addTarget:self action:@selector(clickedBtn:) forControlEvents:UIControlEventTouchDown];
        [self.btns addObject:findByhostpital];
        self.findByHospital = findByhostpital;
        
        UIButton *findByDisease = [[UIButton alloc] init];
        [findByDisease setImage:[UIImage imageWithName:@"icon_index_disease"] forState:UIControlStateNormal];
        [self addSubview:findByDisease];
        [self.btns addObject:findByDisease];
        self.findByDisease = findByDisease;
        
        UIButton *nearHospital = [[UIButton alloc] init];
        [nearHospital setImage:[UIImage imageWithName:@"icon_index_nearHospital"] forState:UIControlStateNormal];
        [self addSubview:nearHospital];
        [self.btns addObject:nearHospital];
        self.nearHospital = nearHospital;
    }
    return self;
}
- (void)clickedBtn:(UIButton *)btn
{
    NSLog(@"i ma here");
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat btnWidth = self.frame.size.width / BUTTONCOUNT;
    CGFloat btnY = 0;
    CGFloat btnHeight = self.frame.size.height;
    CGFloat btnX = 0;
    for (int i = 0; i < BUTTONCOUNT ; i++) {
        UIButton *button = self.btns[i];
        btnX = i * btnWidth;
        button.frame = CGRectMake(btnX, btnY, btnWidth, btnHeight);
    }
    NSLog(@"%@",self.btns);
}
@end













