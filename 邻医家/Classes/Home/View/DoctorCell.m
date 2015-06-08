//
//  DoctorCell.m
//  邻医家
//
//  Created by Daniel on 15/5/6.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "DoctorCell.h"
#import "Doctor.h"
#import "UIImageView+WebCache.h"
#import "Common.h"
#import "UIImage+MJ.h"
@interface DoctorCell ()
@property (nonatomic,weak) UIImageView *iconView;
@property (nonatomic,weak) UILabel *nameLabel;
@property (nonatomic,weak) UILabel *techLabel;
@property (nonatomic,weak) UILabel *professionLabel;
@property (nonatomic,weak) UILabel *introductionLabel;
@property (nonatomic,weak) UILabel *hospital;
@end
@implementation DoctorCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    DoctorCell *cell = [tableView dequeueReusableCellWithIdentifier:DOCID];
    if (cell == nil) {
        cell = [[DoctorCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:DOCID];
    }
    return cell;
}
- (void)setFrame:(CGRect)frame
{
    frame.origin.y += CELLMARGIN;
    frame.origin.x += TABLEMARGIN;
    frame.size.width -= 2 * CELLMARGIN;
    frame.size.height -= CELLMARGIN;
    [super setFrame:frame];
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundView = [[UIView alloc] init];
        
        UIImageView *iconView = [[UIImageView alloc] init];
//        iconView.contentMode = UIViewContentModeCenter;
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.textColor = [UIColor blackColor];
        nameLabel.backgroundColor = [UIColor clearColor];
        nameLabel.font = [UIFont boldSystemFontOfSize:15];
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        UILabel *techLabel = [[UILabel alloc] init];
        techLabel.textColor = [UIColor blackColor];
        techLabel.backgroundColor = [UIColor clearColor];
        techLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:techLabel];
        self.techLabel = techLabel;
        
        UILabel *professionLabel = [[UILabel alloc] init];
        professionLabel.textColor = [UIColor grayColor];
        professionLabel.font = [UIFont systemFontOfSize:13];
        professionLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:professionLabel];
        self.professionLabel = professionLabel;
        
        UILabel *hospitalLabel = [[UILabel alloc] init];
        hospitalLabel.textColor = [UIColor grayColor];
        hospitalLabel.backgroundColor = [UIColor clearColor];
        hospitalLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:hospitalLabel];
        self.hospital = hospitalLabel;
        
        UILabel *introductionLabel = [[UILabel alloc] init];
        introductionLabel.font = [UIFont systemFontOfSize:14];
        introductionLabel.textColor = [UIColor lightGrayColor];
        introductionLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:introductionLabel];
        self.introductionLabel = introductionLabel;
    }
    return self;
}
- (void)setDoctor:(Doctor *)doctor
{
    _doctor = doctor;
    if (doctor.headurl) {
        NSString *imageName = [IMAGEPREF stringByAppendingString:doctor.headurl];
        [self.iconView setImageWithURL:[NSURL URLWithString:imageName] placeholderImage:[UIImage imageWithName:@"doctor_def_img"]];
    }else
    {
        [self.iconView setImage:[UIImage imageNamed:@"doctor_def_img"]];
    }
    
    self.nameLabel.text = doctor.name;
    self.techLabel.text = doctor.techtitle;
    self.introductionLabel.text = doctor.detail;
    self.hospital.text = doctor.hospital;
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
    self.nameLabel.frame = CGRectMake(nameX, nameY, nameW,nameH);
    
    CGFloat techX = CGRectGetMaxX(self.nameLabel.frame) + CELLBORDER;
    CGFloat techY = nameY;
    CGFloat techW = 80;
    CGFloat techH = nameH;
    self.techLabel.frame = CGRectMake(techX, techY, techW, techH);
    
    CGFloat professionX = CGRectGetMaxX(self.nameLabel.frame) + CELLBORDER * 0.5;
    CGFloat professionY = nameY;
    CGFloat professionW = nameW;
    CGFloat professionH = nameH;
    self.professionLabel.frame = CGRectMake(professionX, professionY, professionW, professionH);
    
    CGFloat hosX = nameX;
    CGFloat hosY = CGRectGetMaxY(self.nameLabel.frame) + CELLBORDER * 0.5;
    CGFloat hosW = self.frame.size.width - hosX;
    CGFloat hosH = nameH;
    self.hospital.frame = CGRectMake(hosX, hosY, hosW, hosH);
    
    CGFloat introductionX = nameX;
    CGFloat introductionY = CGRectGetMaxY(self.hospital.frame) + CELLBORDER * 0.5;
    CGFloat introductionW = self.frame.size.width - introductionX;
    CGFloat introductionH = 30;
    self.introductionLabel.frame = CGRectMake(introductionX, introductionY, introductionW, introductionH);
}
@end










