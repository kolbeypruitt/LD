//
//  DoctorView.m
//  邻医家
//
//  Created by Daniel on 15/6/24.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "DoctorView.h"
#import "Doctor.h"
#import "Common.h"
#import "UILabel+LD.h"
#import "AccountTool.h"
@interface DoctorView ()
@property (nonatomic,strong) NSMutableArray *titleLabels;
@property (nonatomic,strong) NSMutableArray *contentLabels;
@property (nonatomic,strong) NSMutableArray *lines;
@end
@implementation DoctorView
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
    static const int count = 4;
    NSArray *titleArray = @[@"职称",@"简介",@"科室",@"登录以后可以了解医生科研，重要病例等信息"];
    for (int i = 0; i<count; i++) {
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
- (void)setDoctor:(Doctor *)doctor
{
    _doctor = doctor;
    UILabel *techtitle = self.contentLabels[0];
    UILabel *introduction  = self.contentLabels[1];
    UILabel *department = self.contentLabels[2];
    techtitle.text = doctor.techtitle;
    if (doctor.detail.length) {
        introduction.text = doctor.detail;
    }else if(doctor.introduction.length)
    {
        introduction.text = doctor.introduction;
    }
    department.text = doctor.department;
    [self layoutCustomViews];
    
}
- (void)layoutCustomViews
{
    CGFloat padding = 10;
    //职称
    UILabel *titleTech = self.titleLabels[0];
    UILabel *contentTech = self.contentLabels[0];
    
    CGFloat techX = padding;
    CGFloat techY = padding;
    CGFloat techW = 40;
    CGFloat techH = 30;
    titleTech.frame = (CGRect){{techX,techY},{techW,techH}};
    
    CGFloat contentX = CGRectGetMaxX(titleTech.frame) + padding;
    CGFloat contentY = techY;
    CGFloat contentW = SCREENWIDTH - contentX - padding;
    CGFloat contentH = techH;
    contentTech.frame = (CGRect){{contentX,contentY},{contentW,contentH}};
    
    UIView *firstLine = [self.lines firstObject];
    firstLine.frame = (CGRect){{padding,CGRectGetMaxY(contentTech.frame) + padding/2},{SCREENWIDTH - 2 * padding,1}};
    //简介
    UILabel *contentIntroduction  = self.contentLabels[1];
    UILabel *titleIntroduction = self.titleLabels[1];
    CGFloat titleIntroctionX = padding;
    CGFloat titleIntroctionY = CGRectGetMaxY(firstLine.frame);
    CGFloat titleIntroctionW = techW;
    CGFloat titleIntroctionH = techH;
    titleIntroduction.frame = CGRectMake(titleIntroctionX, titleIntroctionY, titleIntroctionW, titleIntroctionH);
    CGFloat contentIntroductionX = CGRectGetMaxX(titleIntroduction.frame) + padding;
    CGFloat contentIntroductionY = titleIntroctionY + padding/2;
    CGFloat contentIntroductionW = SCREENWIDTH - contentX - padding;
    NSDictionary *attributes = @{NSFontAttributeName : contentIntroduction.font};
    CGRect rect;
    if (self.doctor.detail.length) {
        rect = [self.doctor.detail boundingRectWithSize:CGSizeMake(contentIntroductionW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    }else if(self.doctor.introduction.length)
    {
        rect = [self.doctor.introduction boundingRectWithSize:CGSizeMake(contentIntroductionW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    }
    CGSize size = rect.size;
    contentIntroduction.frame = (CGRect){{contentIntroductionX,contentIntroductionY},size};
    
    UIView *secondLine = self.lines[1];
    secondLine.frame = (CGRect){{padding,CGRectGetMaxY(contentIntroduction.frame)+ padding/2},{SCREENWIDTH - 2 * padding,1}};
    
    //科室
    UILabel *titleDepartment = self.titleLabels[2];
    UILabel *contentDepartment = self.contentLabels[2];
    CGFloat titleDepartmentX = padding;
    CGFloat titleDepartmentY = CGRectGetMaxY(secondLine.frame);
    CGFloat titleDepartmentW = techW;
    CGFloat titleDepartmentH = techH;
    titleDepartment.frame = CGRectMake(titleDepartmentX, titleDepartmentY, titleDepartmentW, titleDepartmentH);
    CGFloat contentDepartmentX = CGRectGetMaxX(titleDepartment.frame) + padding;
    CGFloat contentDepartmentY = titleDepartmentY;
    CGFloat contentDepartmentW = titleDepartmentW * 2;
    CGFloat contentDepartmentH = titleDepartmentH;
    contentDepartment.frame = CGRectMake(contentDepartmentX, contentDepartmentY, contentDepartmentW, contentDepartmentH);
    UIView *thirdLine = self.lines[2];
    thirdLine.frame = CGRectMake(padding, CGRectGetMaxY(contentDepartment.frame), SCREENWIDTH - 2 *padding, 1);
    //
    if ([AccountTool isLogin]) {
        return;
    }
    UILabel *lastTitleLabel = [self.titleLabels lastObject];
    lastTitleLabel.textAlignment = NSTextAlignmentCenter;
    UIView *lastLine = [self.lines lastObject];
    
    CGFloat lastX = 0;
    CGFloat lastY = CGRectGetMaxY(thirdLine.frame);
    CGFloat lastW = SCREENWIDTH;
    CGFloat lastH = techH;
    lastTitleLabel.frame = CGRectMake(lastX, lastY, lastW, lastH);
    lastLine.frame = CGRectMake(padding, CGRectGetMaxY(lastTitleLabel.frame) + padding/2, SCREENWIDTH - 2 * padding, 1);
    
}
@end



















