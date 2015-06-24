//
//  CaseDetailView.m
//  邻医家
//
//  Created by Daniel on 15/6/24.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "UILabel+LD.h"
#import "CaseDetail.h"
#import "CaseDetailView.h"
#import "Common.h"
@interface CaseDetailView ()
@property (nonatomic,strong) NSMutableArray *titleLabels;
@property (nonatomic,strong) NSMutableArray *contentLabels;
@property (nonatomic,strong) NSMutableArray *lines;
@end
@implementation CaseDetailView
- (NSMutableArray *)titleLabels
{
    if (_titleLabels == nil) {
        _titleLabels = [NSMutableArray array];
    }
    return _titleLabels;
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
        self.userInteractionEnabled = YES;
        self.backgroundColor = IWColor(226, 226, 226);
        [self addCustomViews];
    }
    return self;
}
- (void)addCustomViews
{
    NSArray *titleArray = @[@"性别",@"年龄",@"主诉",@"现病史",@"既往病史",@"查体",@"辅助查体",@"诊断",@"治疗过程",@"登录以后可以了解相关医院，医生信息等详细情况"];
    for (int i = 0; i<titleArray.count; i++) {
        UILabel *titleLabel = [UILabel labelWithTitle:[titleArray objectAtIndex:i]
                                                 font:14
                                            textColor:[UIColor blueColor]];
        [self addSubview:titleLabel];
        [self.titleLabels addObject:titleLabel];
        
        UILabel *contentLabel = [UILabel labelWithTitle:nil
                                                   font:14
                                              textColor:[UIColor blackColor]];
        contentLabel.numberOfLines = 0;
        [self addSubview:contentLabel];
        [self.contentLabels addObject:contentLabel];
        
        UIView *line = [[UIView alloc] init];
        line.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:line];
        [self.lines addObject:line];
    }
}
- (void)setCaseDetail:(CaseDetail *)caseDetail
{
    _caseDetail = caseDetail;
    UILabel *gender = [self.contentLabels firstObject];
    UILabel *age = self.contentLabels[1];
    UILabel *chief = self.contentLabels[2];
    UILabel *illNow = self.contentLabels[3];
    UILabel *illBefore = self.contentLabels[4];
    UILabel *bodyCheck = self.contentLabels[5];
    UILabel *supportCheck = self.contentLabels[6];
    UILabel *diagnose = self.contentLabels[7];
    UILabel *treatmentProcess = self.contentLabels[8];
    
    gender.text = caseDetail.gender;
    age.text =[NSString stringWithFormat:@"%ld",caseDetail.age];
    chief.text = caseDetail.chiefComplaint;
    illNow.text = caseDetail.illNow;
    illBefore.text = caseDetail.illBefore;
    bodyCheck.text = caseDetail.bodyCheck;
    supportCheck.text = caseDetail.supportCheck;
    diagnose.text = caseDetail.diagnose;
    treatmentProcess.text = caseDetail.treatmentProcess;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat padding = 10;
    CGFloat titleX = padding;
    CGFloat titleY = 0;
    CGFloat titleW = 60;
    CGFloat titleH = 30;
    
    CGFloat lineX = padding;
    CGFloat lineY = 0;
    CGFloat lineW = SCREENWIDTH - 2 * padding;
    CGFloat lineH = 1;
    
    CGFloat contentX = 0;
    CGFloat contentY = 0;
    CGFloat contentW = 0;
    CGFloat contentH = titleH;
    
    for (int i = 0; i  < self.lines.count ; i++) {
        UILabel *titleLabel = self.titleLabels[i];
        titleY = i * (titleH + padding/2);
        titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
        
        UIView *line = self.lines[i];
        lineY = CGRectGetMaxY(titleLabel.frame) - 1;
        line.frame = CGRectMake(lineX, lineY, lineW, lineH);
        
        UILabel *contentLabel = self.contentLabels[i];
        contentX = CGRectGetMaxX(titleLabel.frame) + padding;
        contentY = titleY;
        contentW = SCREENWIDTH - contentX - padding;
        contentLabel.frame = CGRectMake(contentX, contentY, contentW, contentH);
    }
    UILabel *lastTitle = [self.titleLabels lastObject];
    lastTitle.textAlignment = NSTextAlignmentCenter;
    CGRect frame = lastTitle.frame;
    frame.size.width = SCREENWIDTH - 2 * padding;
    lastTitle.frame = frame;
    
}
@end

















