//
//  MyAppaliantCell.m
//  邻医家
//
//  Created by Daniel on 15/7/27.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "MyAppaliantCell.h"
#import "EmployInfo.h"
@interface MyAppaliantCell ()
@property (weak, nonatomic) IBOutlet UILabel *nameTitle;
@property (weak, nonatomic) IBOutlet UILabel *timeTitle;
@property (weak, nonatomic) IBOutlet UIImageView *replyImageView;

@end
@implementation MyAppaliantCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"myappaliantcell";
    MyAppaliantCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MyAppaliantCell" owner:nil options:nil] lastObject];
    }
    return cell;
}
- (void)setEmpinfo:(EmployInfo *)empinfo
{
    _empinfo = empinfo;
    self.nameTitle.text = empinfo.name;
    self.timeTitle.text = empinfo.startdate;
    NSString *imageName = nil;
    if (empinfo.succeed == 1) {//已录取
#warning 换图片
        imageName = @"enroll2";
    }else
    {
        imageName = @"unenroll2";
    }
    self.replyImageView.image = [UIImage imageNamed:imageName];
}
@end
