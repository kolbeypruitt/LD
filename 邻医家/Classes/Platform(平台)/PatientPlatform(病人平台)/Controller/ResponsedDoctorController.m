//
//  ResponsedDoctorController.m
//  邻医家
//
//  Created by Daniel on 15/6/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "ResponsedDoctorController.h"
#import "ResponsedDoctorView.h"
@interface ResponsedDoctorController () <ResponsedDoctorViewDelegate>
@property (nonatomic,weak) ResponsedDoctorView *doctorView;
@end
@implementation ResponsedDoctorController
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupDoctorView];
}
- (void)setupDoctorView
{
    ResponsedDoctorView *doctorView = [[ResponsedDoctorView alloc] init];
    doctorView.delegate = self;
    [self.view addSubview:doctorView];
    self.doctorView = doctorView;
    
    self.doctorView.frame = self.view.bounds;
}
- (void)responsedDoctorView:(ResponsedDoctorView *)doctorView inviteBtnClicked:(UIButton *)inviteBtn
{
    NSLog(@"You are amazing!!!");
}
@end
