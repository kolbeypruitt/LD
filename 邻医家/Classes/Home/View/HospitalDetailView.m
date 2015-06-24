//
//  HospitalDetailView.m
//  邻医家
//
//  Created by Daniel on 15/6/24.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "UILabel+LD.h"
#import "HospitalDetail.h"
#import "HospitalDetailView.h"
#import "Common.h"
@interface HospitalDetailView ()
@property (nonatomic,strong) NSMutableArray *titleLabels;
@property (nonatomic,strong) NSMutableArray *contentLabels;
@property (nonatomic,strong) NSMutableArray *lines;
@end
@implementation HospitalDetailView
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
    NSArray *titleArray = @[@"性质",@"简介",@"地区",@"地址",@"网址",@"登录以后可以了解重要科室，重要专家，重要病例"];
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
- (void)setHosdetail:(HospitalDetail *)hosdetail
{
    _hosdetail = hosdetail;
    UILabel *propertyLabel = [self.contentLabels firstObject];
    UILabel *introductionLabel = self.contentLabels[1];
    UILabel *locationLabel = self.contentLabels[2];
    UILabel *addressLabel = self.contentLabels[3];
    UILabel *websiteLabel = self.contentLabels [4];
    
    propertyLabel.text = hosdetail.level;
    introductionLabel.text = hosdetail.introduction;
    locationLabel.text = hosdetail.city;
    addressLabel.text = hosdetail.address;
    websiteLabel.text = hosdetail.website;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
        CGFloat padding = 10;
    //性质
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
    CGRect rect = [self.hosdetail.introduction boundingRectWithSize:CGSizeMake(contentIntroductionW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    CGSize size = rect.size;
    contentIntroduction.frame = (CGRect){{contentIntroductionX,contentIntroductionY},size};
    
    UIView *secondLine = self.lines[1];
    secondLine.frame = (CGRect){{padding,CGRectGetMaxY(contentIntroduction.frame)+ padding/2},{SCREENWIDTH - 2 * padding,1}};
    
    //地区
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
    //地址
    UILabel *addressLabel = self.titleLabels[3];
    UILabel *addressContent = self.contentLabels[3];
    
    CGFloat addressX = padding;
    CGFloat addressY = CGRectGetMaxY(thirdLine.frame);
    CGFloat addressW = techW;
    CGFloat addressH = techH;
    addressLabel.frame = CGRectMake(addressX, addressY, addressW, addressH);
    
    CGFloat addressContentX = CGRectGetMaxX(addressLabel.frame) + padding;
    CGFloat addressContentY = addressY + padding/2;
    CGFloat addressContentW = SCREENWIDTH - addressContentX - padding;
    CGFloat addressContentH = techH;
    addressContent.frame = CGRectMake(addressContentX, addressContentY, addressContentW, addressContentH);
    UIView *fourthLine = self.lines[3];
    fourthLine.frame = CGRectMake(padding, CGRectGetMaxY(addressContent.frame), SCREENWIDTH - 2 * padding, 1);
    //网址
    UILabel *webtitle = self.titleLabels[4];
    UILabel *webContent = self.contentLabels[4];
    
    CGFloat webtitleX = padding;
    CGFloat webtitleY = CGRectGetMaxY(fourthLine.frame);
    CGFloat webtitleW = techW;
    CGFloat webtitleH = techH;
    webtitle.frame = CGRectMake(webtitleX, webtitleY, webtitleW , webtitleH);
    
    CGFloat webcontentX = CGRectGetMaxX(webtitle.frame) + padding;
    CGFloat webcontentY = webtitleY + padding/2;
    CGFloat webcontentW = SCREENWIDTH - webtitleX - padding;
    CGFloat webcontentH = techH;
    webContent.frame = CGRectMake(webcontentX, webcontentY, webcontentW, webcontentH);
    UIView *fifthLine = self.lines[4];
    fifthLine.frame = CGRectMake(padding, CGRectGetMaxY(webContent.frame), SCREENWIDTH -  2 *padding, 1);
    
    
    UILabel *lastTitleLabel = [self.titleLabels lastObject];
    lastTitleLabel.textAlignment = NSTextAlignmentCenter;
    UIView *lastLine = [self.lines lastObject];
    
    CGFloat lastX = 0;
    CGFloat lastY = CGRectGetMaxY(fifthLine.frame);
    CGFloat lastW = SCREENWIDTH;
    CGFloat lastH = techH;
    lastTitleLabel.frame = CGRectMake(lastX, lastY, lastW, lastH);
    lastLine.frame = CGRectMake(padding, CGRectGetMaxY(lastTitleLabel.frame) + padding/2, SCREENWIDTH - 2 * padding, 1);
 
}
@end
