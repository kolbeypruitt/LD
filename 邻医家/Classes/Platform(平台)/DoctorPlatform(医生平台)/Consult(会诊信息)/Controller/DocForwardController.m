//
//  DocForwardController.m
//  邻医家
//
//  Created by Daniel on 15/6/13.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "UIBarButtonItem+ENTER.h"
#import "UILabel+LD.h"
#import "DocForwordModel.h"
#import "Common.h"
#import "MJExtension.h"
#import "DocConsultDetailParam.h"
#import "DocConsultDetailTool.h"
#import "DocForwardController.h"
#import "ConsultMessage.h"
#define COUNT 14
@interface DocForwardController ()
@property (nonatomic,strong) DocForwordModel *model;
@property (nonatomic,strong) NSMutableArray *labels;
@property (nonatomic,strong) NSMutableArray *contentLabels;
@property (nonatomic,strong) NSMutableArray *lines;
@end

@implementation DocForwardController
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
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self loadData];
}
- (void)setup
{
    self.view.backgroundColor = IWColor(226, 226, 226);
    self.navigationItem.title = @"会诊详情";
    [self addCustomViews];
    [self layoutCustomViews];
}
- (void)addCustomViews
{
    NSArray *titleArray = @[@"联系方式",@"科室",@"病人姓名",@"身份证号",@"最后一次就医医院",@"最后一次疾病诊断",@"拟转诊就医地址",@"详细地址",@"接诊医师专业",@"接诊医师职务",@"是否祝愿",@"转诊目的",@"是否需要VIP",@"是否需要抢救"];
    for (int i = 0; i < COUNT; i++) {
        UILabel *titleLabel = [UILabel labelWithTitle:[titleArray objectAtIndex:i]
                                                 font:13
                                            textColor:[UIColor blueColor]];
        [self.view addSubview:titleLabel];
        [self.labels addObject:titleLabel];
        
        UILabel *contentLabel = [UILabel labelWithTitle:nil
                                                 font:13
                                            textColor:[UIColor blackColor]];
        contentLabel.textAlignment = NSTextAlignmentRight;
        [self.view addSubview:contentLabel];
        [self.contentLabels addObject:contentLabel];
        
        [self.lines addObject:[self addDividerLine]];
    }
}
- (UIView *)addDividerLine
{
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:line];
    return line;
}
- (void)layoutCustomViews
{
    CGFloat padding = 8;
    CGFloat titleX = 10;
    CGFloat titleY = 0;
    CGFloat titleW = 110;
    CGFloat titleH = 30;
    
    CGFloat contentX = 0;
    CGFloat contentY = 0;
    CGFloat contentW = 0;
    CGFloat contentH = titleH;
    
    CGFloat lineX = titleX;
    CGFloat lineY = 0;
    CGFloat lineW = SCREENWIDTH - 2 * lineX;
    CGFloat lineH = 1;
    
    for (int i = 0; i < COUNT; i++) {
        UILabel *titleLabel = [self.labels objectAtIndex:i];
        titleY = 84 + (titleH + lineH + padding/2) * i;
        titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
        
        UILabel *contentLabel = [self.contentLabels objectAtIndex:i];
        contentX = CGRectGetMaxX(titleLabel.frame) + padding;
        contentY = titleY;
        contentW = SCREENWIDTH - titleX - contentX;
        contentLabel.frame = CGRectMake(contentX, contentY, contentW, contentH);
        
        UIView *line = [self.lines objectAtIndex:i];
        lineY = CGRectGetMaxY(titleLabel.frame);
        line.frame = CGRectMake(lineX, lineY, lineW, lineH);
    }
}
- (void)loadData
{
    DocConsultDetailParam *param = [DocConsultDetailParam paramWithId:self.message.id];
    [DocConsultDetailTool getDocConsultDetailWithParam:param success:^(id result) {
        self.model = [DocForwordModel objectWithKeyValues:result];
        [self updateUI];
    } failure:^(NSError *error) {
        
    }];
}
- (void)updateUI
{
    NSString *condition = nil;
    if (self.model.gsstatus == 1) {
        condition = @"等待录取";
    }else if(self.model.gsstatus == 2)
    {
        condition = @"已录取";
    }
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:nil action:nil title:condition];
    
    NSArray *contentArray = @[self.model.telnum,self.model.department,self.model.patientName,self.model.idcardNo,self.model.lastHospitalDepartment,self.model.lastDiagnose,self.model.locationToGo,self.model.addressToGo,self.model.profession,self.model.jobType,self.model.ishospital,self.model.purpose,self.model.isVIP,self.model.idfirstaid];
    for (int i = 0; i < self.contentLabels.count; i++) {
        UILabel *contentLabel = [self.contentLabels objectAtIndex:i];
        contentLabel.text = [contentArray objectAtIndex:i];
    }
}


@end
