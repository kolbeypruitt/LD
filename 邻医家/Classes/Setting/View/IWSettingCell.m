//
//  IWSettingCell.m
//  ItcastWeibo
//
//  Created by apple on 14-5-23.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "IWSettingCell.h"
#import "IWSettingItem.h"
#import "IWSettingArrowItem.h"
#import "IWSettingSwitchItem.h"
#import "IWSettingLabelItem.h"
#import "UILabel+LD.h"
#import "UIImage+MJ.h"
#import "IWCommon.h"
@interface IWSettingCell()
/**
 *  箭头
 */
@property (strong, nonatomic) UIImageView *arrowView;
/**
 *  开关
 */
@property (strong, nonatomic) UISwitch *switchView;
/**
 *  提醒数字
 */
@property (nonatomic,strong) UILabel *rightLabel;
@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, weak) UIImageView *bgView;
@property (nonatomic, weak) UIImageView *selectedBgView;
@end

@implementation IWSettingCell
- (UILabel *)rightLabel
{
    if (_rightLabel == nil) {
        _rightLabel = [UILabel labelWithTitle:nil font:14 textColor:[UIColor blackColor]];
        _rightLabel.frame = CGRectMake(0, 0, 160, 40);
        _rightLabel.textAlignment = NSTextAlignmentRight;
    }
    return _rightLabel;
}
- (UISwitch *)switchView
{
    if (_switchView == nil) {
        _switchView = [[UISwitch alloc] init];
    }
    return _switchView;
}

- (UIImageView *)arrowView
{
    if (_arrowView == nil) {
        _arrowView = [[UIImageView alloc] initWithImage:[UIImage imageWithName:@"common_icon_arrow"]];
    }
    return _arrowView;
}



+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"setting";
    IWSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[IWSettingCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        cell.tableView = tableView;
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        // 标题
        self.textLabel.backgroundColor = [UIColor clearColor];
        self.textLabel.textColor = IWColor(88, 202, 203);
        self.textLabel.highlightedTextColor = self.textLabel.textColor;
        self.textLabel.font = [UIFont boldSystemFontOfSize:15];
        
        // 创建背景
        UIImageView *bgView = [[UIImageView alloc] init];
        self.backgroundView = bgView;
        self.bgView = bgView;
        
        UIImageView *selectedBgView = [[UIImageView alloc] init];
        self.selectedBackgroundView = selectedBgView;
        self.selectedBgView = selectedBgView;
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    if (iOS7) {
        frame.origin.x = 5;
        frame.size.width -= 10;
    }
    [super setFrame:frame];
}

- (void)setItem:(IWSettingItem *)item
{
    _item = item;
    [item addObserver:self forKeyPath:@"subtitle" options:0 context:nil];
    // 1.设置数据
    [self setupData];
    
    // 2.设置右边的控件
    [self setupRightView];
}
- (void)dealloc
{
    [self.item removeObserver:self forKeyPath:@"subtitle"];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    self.rightLabel.text = self.item.subtitle;
}
/**
 *  设置cell的背景图片
 *
 */
- (void)setIndexPath:(NSIndexPath *)indexPath
{
    _indexPath = indexPath;
    
    // 设置背景的图片
    NSInteger totalRows = [self.tableView numberOfRowsInSection:indexPath.section];
    NSString *bgName = nil;
    NSString *selectedBgName = nil;
    if (totalRows == 1) { // 这组就1行
        bgName = @"common_card_background";
        selectedBgName = @"common_card_background_highlighted";
    } else if (indexPath.row == 0) { // 首行
        bgName = @"common_card_top_background";
        selectedBgName = @"common_card_top_background_highlighted";
    } else if (indexPath.row == totalRows - 1) { // 尾行
        bgName = @"common_card_bottom_background";
        selectedBgName = @"common_card_bottom_background_highlighted";
    } else { // 中行
        bgName = @"common_card_middle_background";
        selectedBgName = @"common_card_middle_background_highlighted";
    }
    self.bgView.image = [UIImage resizedImageWithName:bgName];
    self.selectedBgView.image = [UIImage resizedImageWithName:selectedBgName];
}

/**
 *  设置数据
 */
- (void)setupData
{
    // 1.图标
    if (self.item.icon) {
        self.imageView.image = [UIImage imageWithName:self.item.icon];
    }
    
    // 2.标题
    self.textLabel.text = self.item.title;
}

/**
 *  设置右边的控件
 */
- (void)setupRightView
{
    if ([self.item isKindOfClass:[IWSettingSwitchItem class]])
    { // 右边是开关
        self.accessoryView = self.switchView;
    }
    else if ([self.item isKindOfClass:[IWSettingArrowItem class]])
    { // 右边是箭头
        self.accessoryView = self.arrowView;
    }
    else if([self.item isKindOfClass:[IWSettingLabelItem class]]){
        self.rightLabel.text = self.item.subtitle;
        self.accessoryView = self.rightLabel;
    }else // 右边没有东西
    {
        
        self.accessoryView = nil;
    }
}

@end
