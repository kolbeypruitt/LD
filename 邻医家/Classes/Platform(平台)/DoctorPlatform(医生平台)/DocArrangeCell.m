//
//  DocArrangeCell.m
//  邻医家
//
//  Created by Daniel on 15/7/17.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "DocArrangeCell.h"
#import "Arrangement.h"
@interface DocArrangeCell ()
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *address;

@end
@implementation DocArrangeCell

+ (instancetype)cellWithTabelView:(UITableView *)tableView
{
    static NSString *ID = @"doccell";
    DocArrangeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"DocArrangeCell" owner:nil options:nil] lastObject];
    }
    return cell;
}
- (void)setArrangement:(Arrangement *)arrangement
{
    _arrangement = arrangement;
    
    self.name.text = arrangement.name;
    self.time.text = arrangement.time;
    self.address.text = arrangement.address;
}
- (void)setFrame:(CGRect)frame
{
    frame.origin.x += 8;
    frame.size.width -= 16;
    
    frame.origin.y += 8;
    frame.size.height -= 8;
    
    [super setFrame:frame];
}
@end
