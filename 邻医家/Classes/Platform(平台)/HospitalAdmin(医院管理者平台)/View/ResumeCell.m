//
//  ResumeCell.m
//  邻医家
//
//  Created by Daniel on 15/6/11.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "UIImage+MJ.h"
#import "Common.h"
#import "Employer.h"
#import "ResumeCell.h"
#import "UIImageView+WebCache.h"
@interface ResumeCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *hospitalLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *techtitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *statusBtn;

@end
@implementation ResumeCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"resume";
    ResumeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ResumeCell" owner:nil options:nil] lastObject];
    }
    return  cell;
}
- (void)setEmployer:(Employer *)employer
{
    _employer = employer;
    if (employer.headurl) {
        NSString *imageName = [IMAGEPREF stringByAppendingString:employer.headurl];
        [self.iconView setImageWithURL:[NSURL URLWithString:imageName] placeholderImage:[UIImage imageWithName:@"doctor_def_img"]];
    }else
    {
        [self.iconView setImage:[UIImage imageNamed:@"doctor_def_img"]];
    }
    
    self.nameLabel.text = employer.name;
    self.techtitleLabel.text = employer.techtitle;
    self.detailLabel.text = employer.detail;
    self.hospitalLabel.text = employer.hospital;
    
    if (employer.status == 1) {
        [self.statusBtn setTitle:@"录取" forState:UIControlStateNormal];
        [self.statusBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        self.statusBtn.enabled = YES;
    }else if (employer.status == 2)
    {
        [self.statusBtn setTitle:@"已录取" forState:UIControlStateNormal];
        [self.statusBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        self.statusBtn.enabled = NO;
    }
}
- (void)setFrame:(CGRect)frame
{
    frame.origin.y += CELLMARGIN;
    frame.origin.x += TABLEMARGIN;
    frame.size.width -= 2 * CELLMARGIN;
    frame.size.height -= CELLMARGIN;
    [super setFrame:frame];
}
@end









