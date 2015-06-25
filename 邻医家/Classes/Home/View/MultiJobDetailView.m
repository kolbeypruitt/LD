//
//  MultiJobDetailView.m
//  邻医家
//
//  Created by Daniel on 15/6/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "PolicyDetail.h"
#import "MultiJobDetailView.h"
#import "Common.h"
#import "UILabel+LD.h"
@interface MultiJobDetailView ()
@property (nonatomic,weak) UILabel *headLabel;
@property (nonatomic,weak) UIView *line;
@property (nonatomic,weak) UILabel *detailLabel;
@end
@implementation MultiJobDetailView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        self.backgroundColor = IWColor(226, 226, 226);
        [self addCustomView];
    }
    return self;
}
- (void)addCustomView
{
    UILabel *headLabel = [UILabel labelWithTitle:nil font:16 textColor:[UIColor blackColor]];
    self.headLabel = headLabel;
    [self addSubview:headLabel];
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor lightGrayColor];
    self.line = line;
    [self addSubview:line];
    
    UILabel *detailLabel = [UILabel labelWithTitle:nil font:14 textColor:[UIColor blackColor]];
    detailLabel.numberOfLines = 0;
    self.detailLabel = detailLabel;
    [self addSubview:detailLabel];
}
- (void)setPolicyDetail:(PolicyDetail *)policyDetail
{
    _policyDetail = policyDetail;
    self.headLabel.text = policyDetail.name;
    self.detailLabel.text = policyDetail.detail;
    [self layoutCustomViews];
}
- (void)layoutCustomViews
{
    CGFloat padding = 10;
    
    CGFloat headX = padding;
    CGFloat headY = padding;
    CGFloat headW = SCREENWIDTH - 2 * padding;
    CGFloat headH = 30;
    self.headLabel.frame = CGRectMake(headX, headY, headW, headH);
    
    CGFloat lineX = padding;
    CGFloat lineY = CGRectGetMaxY(self.headLabel.frame) + padding/2;
    CGFloat lineW = SCREENWIDTH - 2 * padding;
    CGFloat lineH = 1;
    self.line.frame = CGRectMake(lineX, lineY, lineW, lineH);
    
    CGFloat detailX = padding;
    CGFloat detailY = CGRectGetMaxY(self.line.frame) + padding;
    CGFloat detailW = SCREENWIDTH - detailX - padding;
    NSDictionary *attributes = @{NSFontAttributeName : self.detailLabel.font};
    CGRect rect = [self.detailLabel.text boundingRectWithSize:CGSizeMake(detailW, MAXFLOAT)
                                                      options:NSStringDrawingUsesLineFragmentOrigin
                                                   attributes:attributes
                                                      context:nil];
    CGSize size = rect.size;
    
    self.detailLabel.frame = (CGRect){{detailX,detailY},size};   
}
//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//    CGFloat padding = 10;
//    
//    CGFloat headX = padding;
//    CGFloat headY = padding;
//    CGFloat headW = SCREENWIDTH - 2 * padding;
//    CGFloat headH = 30;
//    self.headLabel.frame = CGRectMake(headX, headY, headW, headH);
//    
//    CGFloat lineX = padding;
//    CGFloat lineY = CGRectGetMaxY(self.headLabel.frame) + padding/2;
//    CGFloat lineW = SCREENWIDTH - 2 * padding;
//    CGFloat lineH = 1;
//    self.line.frame = CGRectMake(lineX, lineY, lineW, lineH);
//    
//    CGFloat detailX = padding;
//    CGFloat detailY = CGRectGetMaxY(self.line.frame);
//    CGFloat detailW = SCREENWIDTH - detailX - padding;
//    NSDictionary *attributes = @{NSFontAttributeName : self.detailLabel.font};
//    CGRect rect = [self.detailLabel.text boundingRectWithSize:CGSizeMake(detailW, MAXFLOAT)
//                                                      options:NSStringDrawingUsesLineFragmentOrigin
//                                                   attributes:attributes
//                                                      context:nil];
//    CGSize size = rect.size;
//    
//    self.detailLabel.frame = (CGRect){{detailX,detailY},size};
//}
@end














