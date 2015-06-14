//
//  InviteDetailView.m
//  邻医家
//
//  Created by Daniel on 15/6/14.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "InviteDetailView.h"
#import "Common.h"
#import "InviteDocDetail.h"
#import "UILabel+LD.h"
#import "UIButton+LD.h"
#define COUNT 13
@interface InviteDetailView ()
@property (nonatomic,strong) NSMutableArray *titleLabels;
@property (nonatomic,strong) NSMutableArray *lines;
@property (nonatomic,strong) NSMutableArray *contentLabels;
@property (nonatomic,weak) UIButton *enrollButton;
@end

@implementation InviteDetailView
- (NSMutableArray *)titleLabels
{
    if (_titleLabels == nil) {
        _titleLabels = [NSMutableArray array];
    }
    return _titleLabels;
}
- (NSMutableArray *)lines
{
    if (_lines == nil) {
        _lines = [NSMutableArray array];
    }
    return _lines;
}
- (NSMutableArray *)contentLabels
{
    if (_contentLabels == nil) {
        _contentLabels = [NSMutableArray array];
    }
    return _contentLabels;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = IWColor(226, 226, 226);
        self.showsHorizontalScrollIndicator = NO;
        [self addCustomViews];
        [self layoutCustomViews];
    }
    return self;
}
- (void)addCustomViews
{
    UIButton *enrollBtn = [UIButton buttonWithTitle:nil
                                               font:15
                                         titleColor:[UIColor blueColor]
                                             target:self
                                             action:@selector(enrollBtnClicked:)];
    [enrollBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    self.enrollButton = enrollBtn;
    [self addSubview:enrollBtn];
    
    NSArray *titleArray = @[@"手机号",@"姓名",@"身份证号",@"性别",@"最后一次就医医院",@"最后一次就医科室",@"最后一次诊断",@"地址",@"邀请医生的专业",@"邀请医生的职位",@"请医目的",@"VIP",@"备注"];
    for (int i = 0; i < COUNT; i++) {
        
        UILabel *titleLabel = [UILabel labelWithTitle:[titleArray objectAtIndex:i] font:14 textColor:[UIColor blueColor]];
        titleLabel.numberOfLines = 2;
        titleLabel.textAlignment = NSTextAlignmentRight;
        [self.titleLabels addObject:titleLabel];
        [self addSubview:titleLabel];
        
        UILabel *contentLabel = [UILabel labelWithTitle:nil font:14 textColor:[UIColor blackColor]];
        [self.contentLabels addObject:contentLabel];
        [self addSubview:contentLabel];
        
        UIView *line = [[UIView alloc] init];
        line.backgroundColor = [UIColor lightGrayColor];
        [self.lines addObject:line];
        [self addSubview:line];
    }
}
- (void)enrollBtnClicked:(UIButton *)btn
{
    if ([self.inviteDelegate respondsToSelector:@selector(inviteDetailView:clickedBtn:)]) {
        [self.inviteDelegate inviteDetailView:self clickedBtn:btn];
    }
}
- (void)setDetailMsg:(InviteDocDetail *)detailMsg
{
    _detailMsg = detailMsg;
    if (detailMsg.sdstatus == 1) {//已申请
        [self.enrollButton setTitle:@"待录取" forState:UIControlStateNormal];
        self.enrollButton.enabled = NO;
    }else if(detailMsg.sdstatus == 2)
    {
        [self.enrollButton setTitle:@"已录取" forState:UIControlStateNormal];
        self.enrollButton.enabled = NO;
    }else if(detailMsg.sdstatus == 0)
    {
        [self.enrollButton setTitle:@"接受" forState:UIControlStateNormal];
    }
    UILabel *nameLabel = [self.contentLabels objectAtIndex:1];
    UILabel *idcardNoLabel = [self.contentLabels objectAtIndex:2];
    UILabel *genderLabel = [self.contentLabels objectAtIndex:3];
    UILabel *lastHosLabel = [self.contentLabels objectAtIndex:4];
    UILabel *lastDepLabel = [self.contentLabels objectAtIndex:5];
    UILabel *lastDiaLabel = [self.contentLabels objectAtIndex:6];
    UILabel *addressLabel = [self.contentLabels objectAtIndex:7];
    UILabel *professionLabel = [self.contentLabels objectAtIndex:8];
    UILabel *jobLabel = [self.contentLabels objectAtIndex:9];
    UILabel *purposeLabel = [self.contentLabels objectAtIndex:10];
    UILabel *vipLabel = [self.contentLabels objectAtIndex:11];
    UILabel *remarkLabel = [self.contentLabels objectAtIndex:12];
    
    nameLabel.text = detailMsg.name;
    idcardNoLabel.text = detailMsg.idcardNo;
    genderLabel.text = detailMsg.gender;
    lastHosLabel.text = detailMsg.lastHospital;
    lastDepLabel.text = detailMsg.lastDepartment;
    lastDiaLabel.text = detailMsg.lastDiagnose;
    addressLabel.text = detailMsg.address;
    professionLabel.text = detailMsg.profession;
    jobLabel.text = detailMsg.job;
    purposeLabel.text = detailMsg.purpose;
    vipLabel.text = detailMsg.isVIP;
    remarkLabel.text = detailMsg.remark;
    
}
- (void)layoutCustomViews
{
    CGFloat padding = 10;
    
    CGFloat titleX = padding;
    CGFloat titleY = 0;
    CGFloat titleW = 60;
    CGFloat titleH= 40;
    
    CGFloat contentX = 0;
    CGFloat contentY = 0;
    CGFloat contentW = 0;
    CGFloat contentH = 30;
    
    CGFloat lineX = padding;
    CGFloat lineY = 0;
    CGFloat lineW = SCREENWIDTH - 2 * padding;
    CGFloat lineH = 1;
    
    CGFloat btnW = 50;
    CGFloat btnH = 35;
    CGFloat btnX = SCREENWIDTH/2 - btnW/2;
    CGFloat btnY = 0;
    
    for (int i = 0 ; i < self.titleLabels.count; i++) {
        UILabel *titleLabel = [self.titleLabels objectAtIndex:i];
        titleY = i * (titleH  + lineH);
        titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
        
        UILabel *contentLabel = [self.contentLabels objectAtIndex:i];
        contentX = CGRectGetMaxX(titleLabel.frame) + padding;
        contentY = titleY;
        contentW = SCREENWIDTH - contentX;
        contentLabel.frame = CGRectMake(contentX, contentY, contentW, contentH);
        
        UIView *line = [self.lines objectAtIndex:i];
        lineY = CGRectGetMaxY(titleLabel.frame);
        line.frame = CGRectMake(lineX, lineY, lineW, lineH);
        
    }
    UIView *lastline = [self.lines lastObject];
    btnY = CGRectGetMaxY(lastline.frame) + padding;
    self.enrollButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
}

@end















