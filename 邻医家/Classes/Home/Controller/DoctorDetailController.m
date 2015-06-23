//
//  DoctorDetailController.m
//  邻医家
//
//  Created by Daniel on 15/5/11.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "DoctorDetailController.h"
#import "Doctor.h"
@interface DoctorDetailController ()
@property (weak, nonatomic) IBOutlet UILabel *professionLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *departmentLabel;

@end

@implementation DoctorDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)awakeFromNib
{
//    self.detailLabel.text = self.doctor.detail;
}
- (void)setup
{
    self.title = self.doctor.name;
    self.navigationItem.rightBarButtonItem = nil;
    self.detailLabel.text = self.doctor.introduction;
}
- (void)setDoctor:(Doctor *)doctor
{
    _doctor = doctor;
//    self.detailLabel.text = self.doctor.detail;
}
@end
