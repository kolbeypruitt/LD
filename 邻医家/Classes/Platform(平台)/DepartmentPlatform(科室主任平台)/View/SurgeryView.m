//
//  SurgeryView.m
//  邻医家
//
//  Created by Daniel on 15/6/19.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "Common.h"
#import "SurgeryView.h"
#import "SurgeryModel.h"
#import "SurgeryModel.h"
#import "UIButton+LD.h"
#import "UILabel+LD.h"
@interface SurgeryView ()
@property (nonatomic,weak) UIButton *receivedBtn;
@property (nonatomic,weak) UIButton *confirmedBtn;
@property (nonatomic,strong) NSMutableArray *labels;
@property (nonatomic,strong) NSMutableArray *contentLabels;
@property (nonatomic,strong) NSMutableArray *lines;
@end
@implementation SurgeryView
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
        self.userInteractionEnabled = YES;
        [self addCustomViews];
    }
    return self;
}
- (void)addCustomViews
{
    UIButton *confirmedBtn = [UIButton buttonWithTitle:nil
                                                  font:14
                                            titleColor:[UIColor greenColor]
                                                target:self
                                                action:@selector(buttonClicked:)];
    confirmedBtn.backgroundColor = [UIColor purpleColor];
    [self addSubview:confirmedBtn];
    self.confirmedBtn = confirmedBtn;
    
    UIButton *receivedBtn = [UIButton buttonWithTitle:nil
                                                  font:14
                                            titleColor:[UIColor blueColor]
                                                target:self
                                                action:@selector(buttonClicked:)];
    receivedBtn.backgroundColor = [UIColor darkGrayColor];
    [self addSubview:receivedBtn];
    self.receivedBtn = receivedBtn;
 
    const int count = 10;
    NSArray *titleArray = @[@"科室",@"疾病名称",@"手术名称",@"手术台数",@"手术约定时间",@"手术约定地址",@"详细地址",@"医院名称",@"拟邀医师职位",@"是否住院"];
    for (int i = 0; i < count; i++) {
        UILabel *label = [UILabel labelWithTitle:[titleArray objectAtIndex:i]
                                            font:14
                                       textColor:[UIColor blueColor]];
        [self addSubview:label];
        [self.labels addObject:label];
        
        UILabel *contentLabel = [UILabel labelWithTitle:nil
                                                   font:14
                                              textColor:[UIColor blackColor]];
        contentLabel.textAlignment = NSTextAlignmentRight;
        [self.contentLabels addObject:contentLabel];
        [self addSubview:contentLabel];
        
        UIView *line = [[UIView alloc] init];
        line.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:line];
        [self.lines addObject:line];
    }
}
- (void)buttonClicked:(UIButton *)button
{
//    NSLog(@"You are amazing!!!");
}
- (void)setModel:(SurgeryModel *)model
{
    _model = model;
    NSString *receiveTitle = [NSString stringWithFormat:@"共收到%d封简历",model.all];
    NSString *confirmTitle = [NSString stringWithFormat:@"已录取%d封简历",model.accept];
    [self.confirmedBtn setTitle:confirmTitle forState:UIControlStateNormal];
    [self.receivedBtn setTitle:receiveTitle forState:UIControlStateNormal];
    UILabel *departmentLabel = [self.contentLabels objectAtIndex:0];
    UILabel *illnessLabel  = [self.contentLabels objectAtIndex:1];
    UILabel *operationName = [self.contentLabels objectAtIndex:2];
    UILabel *operationNum = [self.contentLabels objectAtIndex:3];
    UILabel *time = [self.contentLabels objectAtIndex:4];
    UILabel *location = [self.contentLabels objectAtIndex:5];
    UILabel *address = [self.contentLabels objectAtIndex:6];
    UILabel *hospital = [self.contentLabels objectAtIndex:7];
    UILabel *jobType = [self.contentLabels objectAtIndex:8];
    UILabel *ishospital = [self.contentLabels objectAtIndex:9];
    
    departmentLabel.text = model.department;
    illnessLabel.text = model.illness;
    operationName.text = model.opreationName;
    operationNum.text = [NSString stringWithFormat:@"%d",model.operationNum];
    time.text = model.time;
    location.text = model.location;
    address.text = model.address;
    hospital.text = model.hospital;
    jobType.text = model.jobType;
    ishospital.text = model.ishospital;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat padding = 10;
    CGFloat confX = 0;
    CGFloat confY = 64;
    CGFloat confW = self.frame.size.width;
    CGFloat confH = 30;
    self.confirmedBtn.frame = CGRectMake(confX, confY, confW, confH);
    
    CGFloat receiveX = confX;
    CGFloat receiveY = CGRectGetMaxY(self.confirmedBtn.frame);
    CGFloat receiveW = confW;
    CGFloat receiveH = confH;
    self.receivedBtn.frame = CGRectMake(receiveX, receiveY, receiveW, receiveH);
    
    CGFloat titleX = padding;
    CGFloat titleY = 0;
    CGFloat titleW = 100;
    CGFloat titleH = 30;
    
    CGFloat contentX = 0;
    CGFloat contentY = 0;
    CGFloat contentW = 0;
    CGFloat contentH = 30;
    
    CGFloat lineX = padding;
    CGFloat lineY = 0;
    CGFloat lineW = SCREENWIDTH - 2 * padding;
    CGFloat lineH = 1;
    
    for (int i = 0 ; i < self.labels.count; i++) {
        
        UILabel *titleLabel = [self.labels objectAtIndex:i];
        titleY = CGRectGetMaxY(self.receivedBtn.frame) + i * (titleH + lineH + padding);
        titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
        
        UILabel *contentLabel = [self.contentLabels objectAtIndex:i];
        contentX = CGRectGetMaxX(titleLabel.frame) + padding;
        contentY = titleY;
        contentW = SCREENWIDTH - contentX - padding;
        contentLabel.frame = CGRectMake(contentX, contentY, contentW, contentH);
        
        UIView *line = [self.lines objectAtIndex:i];
        lineY = CGRectGetMaxY(titleLabel.frame) - 1;
        line.frame = CGRectMake(lineX, lineY, lineW, lineH);
        
    }
}








@end















