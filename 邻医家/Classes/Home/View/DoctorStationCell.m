//
//  DoctorStationCell.m
//  邻医家
//
//  Created by Daniel on 15/6/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "DoctorStation.h"
#import "DoctorStationCell.h"
#import "UIImage+MJ.h"
#import "UILabel+LD.h"
@interface DoctorStationCell ()
@property (nonatomic,weak) UIImageView *spotView;
@property (nonatomic,weak) UILabel *nameLabel;
@end
@implementation DoctorStationCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"doctorstation";
    DoctorStationCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[DoctorStationCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
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
- (void)addCustomViews;
{
    UILabel *nameLabel = [UILabel labelWithTitle:nil font:14 textColor:[UIColor blackColor]];
    self.nameLabel = nameLabel;
    [self.contentView addSubview:nameLabel];
    
    UIImageView *spotView= [[UIImageView alloc] init];
    spotView.image = [UIImage imageWithName:@"light_blue_point"];
    self.spotView = spotView;
    [self.contentView addSubview:spotView];
}
- (void)setDoctorStation:(DoctorStation *)doctorStation
{
    _doctorStation = doctorStation;
    self.nameLabel.text = doctorStation.name;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat padding = 10;
    CGFloat imageWH = 18;
    self.spotView.frame = CGRectMake(padding, padding, imageWH, imageWH);
    
    CGFloat nameX = CGRectGetMaxX(self.spotView.frame) + padding;
    CGFloat nameY = padding;
    CGFloat nameH = imageWH;
    CGFloat nameW = [UIScreen mainScreen].bounds.size.width - nameX - padding;
    self.nameLabel.frame = CGRectMake(nameX, nameY, nameW, nameH);
}
@end















