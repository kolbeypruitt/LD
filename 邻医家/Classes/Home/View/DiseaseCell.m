//
//  DiseaseCell.m
//  邻医家
//
//  Created by Daniel on 15/5/6.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "DiseaseCell.h"
#import "Common.h"
#import "Case.h"
#import "UIImageView+WebCache.h"
@interface DiseaseCell ()
@property (nonatomic,weak) UIImageView *iconView;
@property (nonatomic,weak) UILabel *nameLabel;
@property (nonatomic,weak) UILabel *detailLabel;
@end
@implementation DiseaseCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    DiseaseCell *cell = [tableView dequeueReusableCellWithIdentifier:DISID];
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:DISID];
    }
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
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
        detailLabel.textColor = [UIColor grayColor];
        detailLabel.font = [UIFont systemFontOfSize:14];
        detailLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:detailLabel];
        self.detailLabel = detailLabel;
        
    }
    return self;
}
- (void)setFrame:(CGRect)frame
{
    frame.origin.y += CELLMARGIN;
    frame.origin.x += TABLEMARGIN;
    frame.size.width -= 2 * CELLMARGIN;
    frame.size.height -= CELLMARGIN;
    [super setFrame:frame];
}
- (void)setCommonCase:(Case *)commonCase
{
    _commonCase = commonCase;
    self.nameLabel.text = commonCase.name;
    self.detailLabel.text =commonCase.detail;
    [self.iconView setImage:[UIImage imageNamed:@"patient_def_img"]];
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat iconXY = CELLBORDER;
    CGFloat iconWH = 60;
    self.iconView.frame = CGRectMake(iconXY, iconXY, iconWH, iconWH);
    
    CGFloat nameX = CGRectGetMaxX(self.iconView.frame) + CELLBORDER;
    CGFloat nameY = iconXY;
    CGFloat nameW = 50;
    CGFloat nameH = 15;
    self.nameLabel.frame = CGRectMake(nameX, nameY, nameW, nameH);
    
    CGFloat detailX = nameX;
    CGFloat detailY = CGRectGetMaxY(self.nameLabel.frame) + CELLBORDER * 0.5;
    CGFloat detailW = self.frame.size.width - detailX;
    CGFloat detailH = 15;
    self.detailLabel.frame = CGRectMake(detailX, detailY, detailW, detailH);
}
@end














