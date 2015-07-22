//
//  LDPersonalController.m
//  邻医家
//
//  Created by Daniel on 15/7/22.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "LDBasePersonalController.h"
#import "LDCheckView.h"
#import "UILabel+LD.h"
static const int count = 6;
static const int timeCount = 14;
@interface LDBasePersonalController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic,strong) NSMutableArray *hosLabels;
@property (nonatomic,strong) NSMutableArray *timeLabels;
@end

@implementation LDBasePersonalController
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
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupCustomViews];
}
- (void)setupCustomViews
{
    self.scrollView.contentSize = CGSizeMake(0, 900);
    [self addCustomViews];
    [self layoutCustomViews];
}
- (void)addCustomViews
{
    for (int i = 0; i < count; i++) {
        
        NSString *title = [NSString stringWithFormat:@"医院%d",i+1];
        UILabel *hosLabel = [UILabel labelWithTitle:title font:15 textColor:[UIColor blackColor]];
        [self.scrollView addSubview:hosLabel];
        [self.hosLabels addObject:hosLabel];
        
        LDCheckView *checkView = [[LDCheckView alloc] init];
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
- (void)layoutCustomViews
{
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
    if (self.view.frame.size.width < 550) {
        padding = 10;
    }else
    {
        padding = 20;
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
@end
