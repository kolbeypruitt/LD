//
//  DepartmentCell.m
//  邻医家
//
//  Created by Daniel on 15/6/26.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "LoginDepartmentCell.h"
#import "UIImage+MJ.h"
#import "UILabel+LD.h"
#import "Common.h"
#import "Department.h"
@interface LoginDepartmentCell ()
@property (nonatomic,weak) UIImageView *iconView;
@property (nonatomic,weak) UILabel *departmentLabel;
@property (nonatomic,weak) UILabel *detailLabel;
@end
@implementation LoginDepartmentCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"LoginDepartmentCell";
    LoginDepartmentCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[LoginDepartmentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}
- (void)setFrame:(CGRect)frame
{
    CGFloat padding = 8;
    frame.origin.x += padding;
    frame.origin.y += padding;
    frame.size.width -= 2 * padding;
    frame.size.height -= padding;
    [super setFrame:frame];
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addCustomViews];
    }
    return self;
}
- (void)addCustomViews
{
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.image = [UIImage imageWithName:@"office_def_img"];
    self.iconView = iconView;
    [self.contentView addSubview:iconView];
    
    UILabel *departmentLabel = [UILabel labelWithTitle:nil font:14 textColor:[UIColor blackColor]];
    self.departmentLabel = departmentLabel;
    [self.contentView addSubview:departmentLabel];
    
    NSString *title = @"第二军医大学呼吸内科由呼吸病区，呼吸重症病房和呼吸实验室组成.";
    UILabel *detailLabel = [UILabel labelWithTitle:title font:14 textColor:[UIColor grayColor]];
    self.detailLabel = detailLabel;
    [self.contentView addSubview:detailLabel];
    
}
- (void)setDepartment:(Department *)department
{
    _department = department;
    self.departmentLabel.text = department.name;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat padding = 10;
    
    CGFloat iconX = padding;
    CGFloat iconY = padding;
    CGFloat iconWH = 40;
    self.iconView.frame = CGRectMake(iconX, iconY, iconWH, iconWH);
    
    CGFloat departmentX = CGRectGetMaxX(self.iconView.frame) + padding/2;
    CGFloat departmentY = iconY;
    CGFloat departmentW = SCREENWIDTH - departmentX - padding * 2;
    CGFloat departmentH = 30;
    self.departmentLabel.frame = CGRectMake(departmentX, departmentY, departmentW, departmentH);
    
    CGFloat detailX = departmentX;
    CGFloat detailY = CGRectGetMaxY(self.departmentLabel.frame) + padding/2;
    CGFloat detailW = departmentW;
    CGFloat detailH = departmentH;
    self.detailLabel.frame = CGRectMake(detailX, detailY, detailW, detailH);
}
@end















