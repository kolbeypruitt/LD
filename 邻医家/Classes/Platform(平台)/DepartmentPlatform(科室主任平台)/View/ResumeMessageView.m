//
//  ResumeMessageView.m
//  邻医家
//
//  Created by Daniel on 15/6/4.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "ConsultDetailResult.h"
#import "ResumeMessageView.h"
@interface ResumeMessageView ()
/**
 *  收到的简历
 */
@property (nonatomic,weak) UIButton *receivedBtn;
/**
 *  已录取的简历
 */
@property (nonatomic,weak) UIButton *confirmedBtn;
@property (nonatomic,weak) UIImageView *firstLine;
@property (nonatomic,weak) UIImageView *secondLine;
@end
@implementation ResumeMessageView
- (void)setResult:(ConsultDetailResult *)result
{
    _result = result;
    NSString *allResume = [NSString stringWithFormat:@"一共收到%d封简历",result.all];
    NSString *confirmedResume = [NSString stringWithFormat:@"已录取%d封简历",result.accept];
    [self.receivedBtn setTitle:allResume forState:UIControlStateNormal];
    [self.confirmedBtn setTitle:confirmedResume forState:UIControlStateNormal];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIButton *receivedBtn = [[UIButton alloc] init];
        receivedBtn.tag = 1;
        receivedBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        receivedBtn.titleLabel.backgroundColor = [UIColor clearColor];
        [receivedBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [receivedBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:receivedBtn];
        self.receivedBtn = receivedBtn;
        
        UIButton *confirmedBtn = [[UIButton alloc] init];
        confirmedBtn.tag = 2;
        [confirmedBtn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
        confirmedBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        confirmedBtn.titleLabel.backgroundColor = [UIColor clearColor];
        [confirmedBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        self.confirmedBtn = confirmedBtn;
        [self addSubview:confirmedBtn];
        
        UIImageView *firstLine = [[UIImageView alloc] init];
        firstLine.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:firstLine];
        self.firstLine = firstLine;
        
        UIImageView *secondLine = [[UIImageView alloc] init];
        secondLine.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:secondLine];
        self.secondLine = secondLine;
    }
    return self;
}
- (void)buttonClicked:(UIButton *)senderBtn
{
    if ([self.delegate respondsToSelector:@selector(resumeMessageView:clickedBtn:)]) {
        [self.delegate resumeMessageView:self clickedBtn:senderBtn];
    }
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat viewW = self.frame.size.width;
    CGFloat viewH = self.frame.size.height;
    
    CGFloat receivedX = 0;
    CGFloat receivedY = 0;
    CGFloat receivedW = viewW;
    CGFloat receivedH = viewH/2 - 4;
    self.receivedBtn.frame = CGRectMake(receivedX, receivedY, receivedW, receivedH);
    
    self.firstLine.frame = CGRectMake(receivedX, CGRectGetMaxY(self.receivedBtn.frame), receivedW, 2);
    
    CGFloat confirmedX = 0;
    CGFloat confirmedY = CGRectGetMaxY(self.firstLine.frame);
    CGFloat confirmedW = receivedW;
    CGFloat confirmedH = receivedH;
    self.confirmedBtn.frame = CGRectMake(confirmedX, confirmedY, confirmedW, confirmedH);
    
    self.secondLine.frame = CGRectMake(receivedX, CGRectGetMaxY(self.confirmedBtn.frame), receivedW, 2);
    
}
@end







