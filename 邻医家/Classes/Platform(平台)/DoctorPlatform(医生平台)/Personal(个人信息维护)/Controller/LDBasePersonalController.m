//
//  LDPersonalController.m
//  邻医家
//
//  Created by Daniel on 15/7/22.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
//判断iphone6
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

//判断iphone6+
#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#import "LDBasePersonalController.h"
#import "LDCheckView.h"
#import "MBProgressHUD+MJ.h"
#import "UILabel+LD.h"
#import "LDArrangement.h"
static const int count = 6;
static const int timeCount = 14;
@interface LDBasePersonalController ()
@property (weak, nonatomic)  UIScrollView *scrollView;
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
    self.title = @"个人安排";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupCustomViews];
}
- (void)setupCustomViews
{
    [self addCustomViews];
    self.scrollView.contentSize = CGSizeMake(0, 900);
    [self layoutCustomViews];
}
- (void)addCustomViews
{
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    for (int i = 0; i < count; i++) {
        
        UITextField *hosField = [[UITextField alloc] init];
        hosField.font = [UIFont systemFontOfSize:8];
        hosField.borderStyle = UITextBorderStyleRoundedRect;
        [self.scrollView addSubview:hosField];
        [self.hosLabels addObject:hosField];
        
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
    
    CGFloat scrollX = 0;
    CGFloat scrollY = 0;
    CGFloat scrollW = self.view.frame.size.width;
    CGFloat scrollH = self.view.frame.size.height - scrollY;
    self.scrollView.frame = CGRectMake(scrollX, scrollY, scrollW, scrollH);
    
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
        UITextField *hosfield = self.hosLabels[i];
        hosX = 50 + (hosW + padding) * i;
        hosfield.frame = CGRectMake(hosX, hosY, hosW, hosH);
       
        LDCheckView *check = self.checkViews[i];
        checkX = hosX;
        checkY = CGRectGetMaxY(hosfield.frame) + padding/2;
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
/*
 * 设置安排
 */
- (void)setArrangement:(LDArrangement *)arrangement
{
    _arrangement = arrangement;
    
    [self setHospitalWithData:arrangement.arrangeHospitals];
    [self setArrangementWithData:arrangement.arrangements];
}
- (void)setHospitalWithData:(NSString *)hospitals
{
    NSArray *hospitalNames = [hospitals componentsSeparatedByString:@","];
    for ( int i = 0 ; i < count; i++) {
        NSString *hosname = hospitalNames[i];
        UITextField *hosfield = self.hosLabels[i];
        hosfield.text = hosname;
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
- (BOOL)messageComplete
{
    for (int i = 0;i < self.hosLabels.count;i++)
    {
        UITextField *textfield = self.hosLabels[i];
        if (textfield.text.length == 0) {
            [MBProgressHUD showError: [NSString stringWithFormat:@"请填写第%d医院信息",i]];
            return NO;
        }
    }
    return YES;
}
@end
