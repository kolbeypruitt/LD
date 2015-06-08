//
//  InviteDoctorView.m
//  邻医家
//
//  Created by Daniel on 15/6/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "Common.h"
#define NUMBEROFCONTENT 12
#import "InviteDoctorView.h"
#import "UILabel+LD.h"
@interface InviteDoctorView ()
@property (nonatomic,strong) NSMutableArray *labels;
@property (nonatomic,strong) NSMutableArray *contentLabels;
@property (nonatomic,strong) NSMutableArray *lines;
@end
@implementation InviteDoctorView
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
        [self setupLabels];
        [self setupContentLabels];
        [self setupLines];
    }
    return self;
}
- (void)setupLabels
{
    NSArray *labelArray = @[@"姓名",@"身份证号",@"性别",@"最后一次就医医院",@"最后一次就医科室",@"最后一次诊断",@"地址",@"邀请医生的专业",@"邀请医生的职位",@"请医目的",@"VIP",@"备注"];
    const int count = (int)labelArray.count;
    for (int i = 0; i < count; i++) {
        UILabel *label = [UILabel labelWithTitle:[labelArray objectAtIndex:i] font:14 textColor:[UIColor blueColor]];
        label.numberOfLines = 2;
        label.textAlignment = NSTextAlignmentRight;
        [self addSubview:label];
        [self.labels addObject:label];
    }
}
- (void)setupContentLabels
{
    for (int i = 0; i < NUMBEROFCONTENT; i++) {
        UILabel *contentLabel = [UILabel labelWithTitle:nil font:14 textColor:[UIColor blackColor]];
        [self addSubview:contentLabel];
        [self.contentLabels addObject:contentLabel];
    }
}
- (void)setupLines
{
    for ( int i = 0; i < NUMBEROFCONTENT; i++) {
        UIView *line = [[UIView alloc] init];
        line.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:line];
        [self.lines addObject:line];
    }
}
- (void)setMessage:(MessageOfInviteDoctor *)message
{
    _message = message;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.contentSize = CGSizeMake(0, self.frame.size.height * 1.2);
    CGFloat padding = 10;
    
    CGFloat labelX = padding;
    CGFloat labelY = 0;
    CGFloat labelW = 60;
    CGFloat labelH = 40;
    
    CGFloat contentX = 0;
    CGFloat contentY = 0;
    CGFloat contentW = 0;
    CGFloat contentH = 30;
    
    CGFloat lineX = padding;
    CGFloat lineY = 0;
    CGFloat lineW = SCREENWIDTH - 2 * padding;
    CGFloat lineH = 1;
    
    for (int i = 0; i < NUMBEROFCONTENT; i++) {
        UILabel *label = [self.labels objectAtIndex:i];
        labelY = i * (labelH + padding);
        label.frame = CGRectMake(labelX, labelY, labelW, labelH);
        
        UILabel *contentLabel = [self.contentLabels objectAtIndex:i];
        contentX = CGRectGetMaxX(label.frame);
        contentY = labelY;
        contentW = SCREENWIDTH - contentX - padding;
        contentLabel.frame = CGRectMake(contentX, contentY, contentW, contentH);
        
        UIView *line = [self.lines objectAtIndex:i];
        lineY = CGRectGetMaxY(label.frame);
        line.frame = CGRectMake(lineX, lineY, lineW, lineH);
    }
    
}
@end














