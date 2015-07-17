//
//  LDEnterCell.m
//  邻医家
//
//  Created by Daniel on 15/7/17.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "LDEnterCell.h"
@interface LDEnterCell ()
@property (nonatomic,weak) UIImageView *iconView;
@end
@implementation LDEnterCell
+ (instancetype)cellWithTabelView:(UITableView *)tableView
{
    static  NSString *ID = @"ldentercell";
    LDEnterCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[LDEnterCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIImageView *iconView = [[UIImageView alloc] init];
        iconView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
       
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.iconView.frame = self.bounds;
  
}
- (void)setImageName:(NSString *)imageName
{
    _imageName = imageName;
    self.iconView.image = [UIImage imageNamed:imageName];
}
@end
