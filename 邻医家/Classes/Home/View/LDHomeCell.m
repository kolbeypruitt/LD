//
//  LDHomeCell.m
//  邻医家
//
//  Created by Daniel on 15/5/4.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#define CELLBORDER 10
#import "UIImage+MJ.h"
#import "Doctor.h"
#import "LDHomeCell.h"
#import "HomeItem.h"
#import "UIImageView+WebCache.h"
@interface LDHomeCell ()
@property (nonatomic,weak) UIImageView *iconView;
@property (nonatomic,weak) UILabel *nameLabel;
@property (nonatomic,weak) UILabel *hospitalLabel;
@property (nonatomic,weak) UILabel *infoLabel;
@end

@implementation LDHomeCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"ldhome";
    LDHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[LDHomeCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectedBackgroundView = [[UIView alloc] init];
        self.backgroundColor = [UIColor clearColor];
        
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
       
        UILabel *nameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        UILabel *hospitalLabel = [[UILabel alloc] init];
        [self.contentView addSubview:hospitalLabel];
        self.hospitalLabel = hospitalLabel;
        
        UILabel *infoLabel = [[UILabel alloc] init];
        [self.contentView addSubview:infoLabel];
        self.infoLabel = infoLabel;
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat iconX = CELLBORDER;
    CGFloat iconY = CELLBORDER;
    CGFloat iconWH = 50;
    self.iconView.frame = CGRectMake(iconX, iconY, iconWH, iconWH);
    
    CGFloat nameLabelX = CGRectGetMaxX(self.iconView.frame) + CELLBORDER;
    CGFloat nameLabelY = iconY;
    CGFloat nameLabelW = self.frame.size.width - nameLabelX;
    CGFloat nameLabelH = 15;
    self.nameLabel.frame = CGRectMake(nameLabelX, nameLabelY, nameLabelW, nameLabelH);
    
    CGFloat hospitalLabelX = nameLabelX;
    CGFloat hospitalLabelY = CGRectGetMaxY(self.nameLabel.frame) + CELLBORDER;
    CGFloat hospitalLabelW = nameLabelW;
    CGFloat hospitalLabelH = nameLabelH;
    self.hospitalLabel.frame = CGRectMake(hospitalLabelX, hospitalLabelY, hospitalLabelW, hospitalLabelH);
    
    CGFloat infoLabelX = hospitalLabelX;
    CGFloat infoLabelY = CGRectGetMaxY(self.hospitalLabel.frame) + CELLBORDER;
    CGFloat infoLabelW = hospitalLabelW;
    CGFloat infoLabelH = hospitalLabelH;
    self.infoLabel.frame = CGRectMake(infoLabelX, infoLabelY, infoLabelW, infoLabelH);
}
- (void)setItem:(HomeItem *)item
{
    _item = item;
    
    [self.iconView setImageWithURL:[NSURL URLWithString:item.image] placeholderImage:[UIImage imageWithName:@"hospital_def_img"]];
    
    self.nameLabel.text = item.name;
    
    
    self.infoLabel.text = item.detail;
}
@end












