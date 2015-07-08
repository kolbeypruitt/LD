//
//  DepartmentManagerCell.m
//  邻医家
//
//  Created by Daniel on 15/7/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "DepartmentManagerCell.h"
#import "DepartmentManager.h"
@interface DepartmentManagerCell ()
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *departmentLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@end
@implementation DepartmentManagerCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"manager";
    DepartmentManagerCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"DepartmentManagerCell" owner:nil options:nil] lastObject];
    }
    return cell;
}
- (void)setManager:(DepartmentManager *)manager
{
    _manager = manager;
    self.phoneLabel.text = manager.telnum;
    self.departmentLabel.text = manager.department;
    self.nameLabel.text = manager.name;
}
@end
