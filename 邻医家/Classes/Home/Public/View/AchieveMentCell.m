//
//  AchieveMentCell.m
//  邻医家
//
//  Created by Daniel on 15/6/11.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDPaper.h"
#import "AchieveMentCell.h"
#import "UILabel+LD.h"
@interface AchieveMentCell ()
@property (nonatomic,weak) UILabel *nameLabel;
@property (nonatomic,weak) UILabel *introductionLabel;
@end
@implementation AchieveMentCell
+ (instancetype)cellWithTabelView:(UITableView *)tableView
{
    static NSString *ID = @"achievementcell";
    AchieveMentCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[AchieveMentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
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
    UILabel *nameLabel = [UILabel labelWithTitle:nil font:15 textColor:[UIColor blackColor]];
    self.nameLabel = nameLabel;
    [self.contentView addSubview:nameLabel];
    
    UILabel *introductionLabel = [UILabel labelWithTitle:nil font:14 textColor:[UIColor grayColor]];
    introductionLabel.numberOfLines = 3;
    self.introductionLabel = introductionLabel;
    [self.contentView addSubview:introductionLabel];
}
- (void)setPaper:(LDPaper *)paper
{
    _paper = paper;
    
    self.nameLabel.text = paper.title;
    self.introductionLabel.text = paper.introduction;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat padding = 10;
    
    CGFloat titleX = padding;
    CGFloat titleY = padding;
    CGFloat titleW = self.superview.frame.size.width - 2 * padding;
    CGFloat titleH = 30;
    self.nameLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    CGFloat introX = padding;
    CGFloat introY = CGRectGetMaxY(self.nameLabel.frame);
    CGFloat introW = titleW;
    CGFloat introH = 2 * titleH;
    self.introductionLabel.frame = CGRectMake(introX, introY, introW, introH);
}
@end







