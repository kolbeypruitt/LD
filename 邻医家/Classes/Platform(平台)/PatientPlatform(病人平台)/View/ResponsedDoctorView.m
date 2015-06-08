//
//  ResponsedDoctorView.m
//  邻医家
//
//  Created by Daniel on 15/6/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "Common.h"
#define COUNT 7
#import "UIButton+LD.h"
#import "ResponsedDoctorView.h"
#import "UILabel+LD.h"
@interface ResponsedDoctorView ()
@property (nonatomic,strong) NSMutableArray *labels;
@property (nonatomic,strong) NSMutableArray *contentLabels;
@property (nonatomic,strong) NSMutableArray *lines;
@property (nonatomic,weak) UIButton  *inviteBtn;
@end
@implementation ResponsedDoctorView
- (NSMutableArray *)labels
{
    if (_labels == nil) {
        _labels = [NSMutableArray array];
    }
    return _labels;
}
- (NSMutableArray *)contentLabels
{
    if (_contentLabels == nil) {
        _contentLabels = [NSMutableArray array];
    }
    return _contentLabels;
}
- (NSMutableArray *)lines
{
    if (_lines == nil) {
        _lines = [NSMutableArray array];
    }
    return _lines;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = IWColor(226, 226, 226);
        [self setupLabels];
        [self setupContentLabels];
        [self setupLines];
        [self addBtn];
    }
    return self;
}
- (void)setupLabels
{
    NSArray *labelArray = @[@"医院",@"职称",@"简介",@"科室",@"手机号",@"简历状态",@"成果"];
    for (int i = 0 ; i < COUNT; i++) {
        UILabel *label = [UILabel labelWithTitle:[labelArray objectAtIndex:i]
                                            font:14
                                       textColor:[UIColor blueColor]];
        label.textAlignment = NSTextAlignmentRight;
        [self addSubview:label];
        [self.labels addObject:label];
    }
    
}
- (void)setupContentLabels
{
    for (int i = 0; i < COUNT; i++) {
        UILabel *contentLabel = [UILabel labelWithTitle:nil font:14 textColor:[UIColor blueColor]];
        [self addSubview:contentLabel];
        [self.contentLabels addObject:contentLabel];
    }
}
- (void)setupLines
{
    for (int i = 0; i < COUNT + 1; i++) {
        UIView *line = [[UIView alloc] init];
        line.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:line];
        [self.lines addObject:line];
    }
    
}
- (void)addBtn
{
    UIButton *button = [UIButton buttonWithTitle:@"邀请此医生"
                                            font:14
                                      titleColor:[UIColor blueColor]
                                          target:self
                                          action:@selector(inviteBtnClicked:)];
    [self addSubview:button];
    self.inviteBtn = button;
}
- (void)inviteBtnClicked:(UIButton *)button
{
    if([self.delegate respondsToSelector:@selector(responsedDoctorView:inviteBtnClicked:)])
    {
        [self.delegate responsedDoctorView:self inviteBtnClicked:button];
    }
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat padding = 10;
    CGFloat labelX = padding;
    CGFloat labelY = 0;
    CGFloat labelW = 60;
    CGFloat labelH = 35;
    
    CGFloat contentX = 0;
    CGFloat contentY = 0;
    CGFloat contentW = 0;
    CGFloat contentH = 30;
    
    CGFloat lineX = padding;
    CGFloat lineY = 0;
    CGFloat lineW = SCREENWIDTH - 2 * padding;
    CGFloat lineH = 1;
    
    for ( int i = 0; i < COUNT; i++) {
        UILabel *label = [self.labels objectAtIndex:i];
        labelY = 74 + i * (labelH + padding);
        label.frame = CGRectMake(labelX, labelY, labelW, labelH);
        
        UILabel *contentLabel = [self.contentLabels objectAtIndex:i];
        contentX = CGRectGetMaxX(label.frame);
        contentY = labelY;
        contentW = SCREENWIDTH - contentX - padding;
        contentLabel.frame = CGRectMake(contentX, contentY, contentW, contentH);
        
        UIView *line = [self.lines objectAtIndex:i];
        lineY = CGRectGetMaxY(label.frame) + padding/2;
        line.frame = CGRectMake(lineX, lineY, lineW, lineH);
    }
    
    UILabel *lastLabel = [self.labels lastObject];
    CGFloat btnX = padding;
    CGFloat btnY = CGRectGetMaxY(lastLabel.frame) + padding;
    CGFloat btnW = SCREENWIDTH - 2 * padding;
    CGFloat btnH = 35;
    
    self.inviteBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    
    UIView *lastLine = [self.lines lastObject];
    lastLine.frame = CGRectMake(padding, CGRectGetMaxY(self.inviteBtn.frame) + padding, SCREENWIDTH - 2 * padding, 1);
    
}

@end












