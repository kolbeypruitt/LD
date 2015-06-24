//
//  DoctorDetailController.m
//  邻医家
//
//  Created by Daniel on 15/5/11.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "DoctorDetailController.h"
#import "Doctor.h"
#import "Common.h"
#import "DoctorView.h"
#import "DoctorDetailTool.h"
#import "DoctorDetailResult.h"
#import "DoctorDetailParam.h"
@interface DoctorDetailController ()
@property (nonatomic,weak) DoctorView *docView;
@end

@implementation DoctorDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self setup];
}
- (void)loadData
{
    DoctorDetailParam *param = [DoctorDetailParam paramWithId:self.doctor.id];
    [DoctorDetailTool doctorDetailWithParam:param success:^(DoctorDetailResult *result) {
        [self addDoctorView];
        self.docView.doctor = result.doctor;
    } failure:^(NSError *error) {
        
    }];
}
- (void)setup
{
    self.title = self.doctor.name;
    self.view.backgroundColor = IWColor(226, 226, 226);
    self.navigationItem.rightBarButtonItem = nil;
    
}
- (void)addDoctorView
{
    DoctorView *docView = [[DoctorView alloc] init];
    docView.frame = (CGRect){{0,64},{SCREENWIDTH,SCREENHEIGHT - 64}};
    [self.view addSubview:docView];
    self.docView = docView;
}
- (void)setDoctor:(Doctor *)doctor
{
    _doctor = doctor;
}
@end
