//
//  LDAssignmentView.m
//  邻医家
//
//  Created by Daniel on 15/7/23.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
//判断iphone6
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

//判断iphone6+
#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
static const int count = 6;
static const int timeCount = 14;

#import "LDAssignmentView.h"
#import "LDArrangement.h"
#import "AssignmentTool.h"
#import "UILabel+LD.h"
#import "LDCheckView.h"
@interface LDAssignmentView ()
@property (weak, nonatomic)  UIScrollView *scrollView;
@property (nonatomic,strong) NSMutableArray *hosLabels;
@property (nonatomic,strong) NSMutableArray *timeLabels;
@end
@implementation LDAssignmentView

- (NSMutableArray *)hosLabels
{
    if (_hosLabels == nil) {
        _hosLabels = [NSMutableArray array];
    }
    return _hosLabels;
}
- (NSMutableArray *)checkViews
{
    if (_checkViews == nil) {
        _checkViews = [NSMutableArray array];
    }
    return _checkViews;
}
- (NSMutableArray *)timeLabels
{
    if (_timeLabels == nil) {
        _timeLabels = [NSMutableArray array];
    }
    return _timeLabels;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addCustomViews];
    }
    return self;
}
- (void)addCustomViews
{
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    [self addSubview:scrollView];
    self.scrollView = scrollView;
    for (int i = 0; i < count; i++) {
        
        UILabel *hosLabel = [UILabel labelWithTitle:nil font:11 textColor:[UIColor blackColor]];
        hosLabel.numberOfLines = 2;
        [self.scrollView addSubview:hosLabel];
        [self.hosLabels addObject:hosLabel];
        
        LDCheckView *checkView = [[LDCheckView alloc] init];
        checkView.userInteractionEnabled = NO;
        checkView.tag = i;
        [checkView addObserver:self forKeyPath:@"checkMessage" options:0 context:nil];
        [self.scrollView addSubview:checkView];
        [self.checkViews addObject:checkView];
    }
    NSArray *timeArray = @[@"周一上午",@"周一下午",@"周二上午",@"周二下午",@"周三上午",@"周三下午",@"周四上午",@"周四下午",@"周五上午",@"周五下午",@"周六上午",@"周六下午",@"周日上午",@"周日下午"];
    for (int i = 0; i < timeArray.count;i++)
    {
        NSString *title = [timeArray objectAtIndex:i];
        UILabel *timeLabel = [UILabel labelWithTitle:title
                                                font:15
                                           textColor:[UIColor blackColor]];
        
        timeLabel.numberOfLines = 2;
        [self.scrollView addSubview:timeLabel];
        [self.timeLabels addObject:timeLabel];
    }
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat scrollX = 0;
    CGFloat scrollY = 0;
    CGFloat scrollW = self.frame.size.width;
    CGFloat scrollH = self.frame.size.height - scrollY;
    self.scrollView.frame = CGRectMake(scrollX, scrollY, scrollW, scrollH);
    self.scrollView.contentSize = CGSizeMake(0, 900);
    
    CGFloat hosX = 0;
    CGFloat hosY = 10;
    CGFloat hosW = 40;
    CGFloat hosH = 30;
    
    CGFloat checkX = 0;
    CGFloat checkY = 0;
    CGFloat checkW = 30;
    CGFloat checkH = 800;
    
    CGFloat timeX = 5;
    CGFloat timeY = 0;
    CGFloat timeW = 40;
    CGFloat timeH = 40;
    
    CGFloat padding = 0;
    if (iPhone6) {
        padding = 10;
    }
    else if(iPhone6Plus)
    {
        padding = 20;
    }
    else{
        padding = 5;
    }
    
    for (int i = 0; i < count; i++) {
        UILabel *hosLabel = self.hosLabels[i];
        hosX = 50 + (hosW + padding) * i;
        hosLabel.frame = CGRectMake(hosX, hosY, hosW, hosH);
       
        LDCheckView *check = self.checkViews[i];
        checkX = hosX;
        checkY = CGRectGetMaxY(hosLabel.frame) + padding/2;
        check.frame = CGRectMake(checkX, checkY, checkW, checkH);
    }
    
    for (int i = 0; i < timeCount; i++) {
        UILabel *timeLabel = self.timeLabels[i];
        timeY = 64 + (timeH + 10) * i;
        timeLabel.frame = CGRectMake(timeX, timeY, timeW, timeH);
    }
}
- (void)dealloc
{
    for (int i = 0; i < count; i++) {
        LDCheckView *checkView = self.checkViews[i];
        [checkView removeObserver:self forKeyPath:@"checkMessage"];
    }
}
- (void)setArrangement:(LDArrangement *)arrangement
{
    _arrangement = arrangement;
    
    [AssignmentTool saveAssignment:arrangement];
    
    [self setHospitalWithData:arrangement.arrangeHospitals];
    [self setArrangementWithData:arrangement.arrangements];
}
- (void)setHospitalWithData:(NSString *)hospitals
{
    NSArray *hospitalNames = [hospitals componentsSeparatedByString:@","];
    for ( int i = 0 ; i < count; i++) {
        NSString *hosname = hospitalNames[i];
        UILabel *hoslabel = self.hosLabels[i];
        hoslabel.text = hosname;
    }
    
}
- (void)setArrangementWithData:(NSString *)arrangements
{
   //每个医院的安排
    NSArray *arrangeGroup = [self prepareArrangeData:arrangements];
    for (int i = 0; i < self.checkViews.count; i++) {
        LDCheckView *checkView = self.checkViews[i];
        checkView.checkDatas = arrangeGroup[i];
    }
   
}
- (NSArray *)prepareArrangeData:(NSString *)originData
{
    NSArray *hospitalArrangeStrings = [originData componentsSeparatedByString:@";"];
    
    NSMutableArray *arrangementGroup = [NSMutableArray array];
    for (NSString *arrange in hospitalArrangeStrings) {
        NSArray *hosarrange = [arrange componentsSeparatedByString:@","];
        [arrangementGroup addObject:hosarrange];
    }
    return [arrangementGroup copy];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    
}
@end
