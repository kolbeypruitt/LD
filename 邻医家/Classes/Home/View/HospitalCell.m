//
//  HospitalCell.m
//  邻医家
//
//  Created by Daniel on 15/5/6.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "HospitalCell.h"
#import "UIImageView+WebCache.h"
#import "Common.h"
#import "Hospital.h"
@interface HospitalCell ()
@property (nonatomic,weak) UIImageView *iconView;
@property (nonatomic,weak) UILabel *nameLabel;
@property (nonatomic,weak) UILabel *detailLabel;
@end
@implementation HospitalCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    HospitalCell *cell = [tableView dequeueReusableCellWithIdentifier:HOSID];
    if (cell == nil) {
        cell = [[HospitalCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:HOSID];
    }
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundView = [[UIView alloc] init];
        
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.textColor = [UIColor blackColor];
        nameLabel.backgroundColor = [UIColor clearColor];
        nameLabel.font = [UIFont boldSystemFontOfSize:15];
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        UILabel *detailLabel = [[UILabel alloc] init];
        detailLabel.textColor = [UIColor lightGrayColor];
        detailLabel.font = [UIFont systemFontOfSize:14];
        detailLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:detailLabel];
        self.detailLabel = detailLabel;
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat iconXY = CELLBORDER;
    CGFloat iconWH = 60;
    self.iconView.frame = CGRectMake(iconXY, iconXY, iconWH, iconWH);
    
    CGFloat nameX = CGRectGetMaxX(self.iconView.frame) + CELLBORDER;
    CGFloat nameY = iconXY;
    CGFloat nameW = self.frame.size.width - nameX;
    CGFloat nameH = 15;
    self.nameLabel.frame = CGRectMake(nameX, nameY, nameW,nameH);
    
    CGFloat detailX = nameX;
    CGFloat detailY = CGRectGetMaxY(self.nameLabel.frame) + CELLBORDER * 0.5;
    CGFloat detailW = nameW;
    CGFloat detailH = nameH;
    self.detailLabel.frame = CGRectMake(detailX, detailY, detailW, detailH);
}
- (void)setFrame:(CGRect)frame
{
    frame.origin.y += CELLMARGIN;
    frame.origin.x += TABLEMARGIN;
    frame.size.width -= 2 * CELLMARGIN;
    frame.size.height -= CELLMARGIN;
    [super setFrame:frame];
}
-(void)setHospital:(Hospital *)hospital
{
    _hospital = hospital;
    if (hospital.headurl) {
        NSString *imageName = [IMAGEPREF stringByAppendingString:hospital.headurl];
        [self.iconView setImageWithURL:[NSURL URLWithString:imageName] placeholderImage:[UIImage imageNamed:@"hospital_default"]];
    }else
    {
        [self.iconView setImage:[UIImage imageNamed:@"hospital_default"]];
    }
    self.nameLabel.text = hospital.name;
    self.detailLabel.text = hospital.detail;
}
@end
