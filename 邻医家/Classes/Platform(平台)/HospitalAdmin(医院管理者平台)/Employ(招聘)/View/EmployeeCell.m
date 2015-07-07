//
//  EmployeeCell.m
//  邻医家
//
//  Created by Daniel on 15/6/11.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "EmployeeCell.h"
#import "Employee.h"
@interface EmployeeCell ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLable;
@end
@implementation EmployeeCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"emp";
    EmployeeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"EmployeeCell" owner:nil options:nil] lastObject];
    }
    return cell;
}
- (void)setFrame:(CGRect)frame
{
    frame.origin.x += 8;
    frame.size.width -= 16;
    frame.origin.y += 8;
    frame.size.height -= 8;
    [super setFrame:frame];
}
- (void)awakeFromNib
{
    self.backgroundView = [[UIView alloc] init];
//    self.backgroundColor = [UIColor clearColor];
}
- (void)setEmp:(Employee *)emp
{
    _emp = emp;
    self.nameLabel.text = emp.name;
    self.timeLable.text = emp.createTime;
    
}
@end
