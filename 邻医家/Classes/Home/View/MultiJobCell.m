//
//  MultiJobCellTable.m
//  邻医家
//
//  Created by SXQ on 15/6/24.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "MultiJobCell.h"
#import "DoctorStation.h"
#import "Policy.h"
@interface MultiJobCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *spotView;

@end
@implementation MultiJobCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"multijob";
    MultiJobCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MultiJobCell" owner:nil options:nil] lastObject];
    }
    return cell;
}
- (void)setPolicy:(Policy *)policy
{
    _policy = policy;
    self.titleLabel.text = policy.name;
}
- (void)setDoctorStation:(DoctorStation *)doctorStation
{
    _doctorStation = doctorStation;
    self.titleLabel.text = doctorStation.name;
    
}
@end
