//
//  ArrangementCell.m
//  邻医家
//
//  Created by Daniel on 15/7/9.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "Arrangement.h"
#import "ArrangementCell.h"
@interface ArrangementCell ()
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@end
@implementation ArrangementCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"arrangement";
    ArrangementCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ArrangementCell" owner:nil options:nil] lastObject];
    }
    return cell;
}
- (void)setArrangement:(Arrangement *)arrangement
{
    _arrangement = arrangement;
    self.nameLabel.text = arrangement.name;
    self.timeLabel.text = arrangement.time;
}
- (void)setFrame:(CGRect)frame
{
    frame.origin.x += 10;
    frame.size.width -= 20;
    frame.origin.y += 10;
    frame.size.height -= 10;
    [super setFrame:frame];
}
@end
