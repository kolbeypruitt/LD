//
//  HosDetailController.m
//  邻医家
//
//  Created by Daniel on 15/5/11.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "HosDetailController.h"
#import "HosdetailParam.h"
#import "HospitalDetailTool.h"
#import "Hospital.h"
#import "Common.h"
#import "HospitalResult.h"
#import "HospitalDetail.h"
#import "HospitalDetailView.h"
@interface HosDetailController ()
@property (nonatomic,strong) HospitalDetail *hospitalDetail;
@property (nonatomic,weak) HospitalDetailView *detailView;
@end

@implementation HosDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self setup];
}
- (void)setup
{
    self.view.backgroundColor = IWColor(226, 226, 226);
    self.navigationItem.title = self.hospital.name;
    self.navigationItem.rightBarButtonItem = nil;
}
- (void)loadData
{
    HosdetailParam *param = [HosdetailParam paramWithId:self.hospital.id];
    
    [HospitalDetailTool hospitalDetailWithParam:param success:^(HospitalResult *result) {
        self.hospitalDetail = result.doctor;
    } failure:^(NSError *error) {
        
    }];
}
- (void)setHospitalDetail:(HospitalDetail *)hospitalDetail
{
    _hospitalDetail = hospitalDetail;
    [self addDetailView];
    self.detailView.hosdetail = hospitalDetail;
}
- (void)addDetailView
{
    HospitalDetailView *detailView = [[HospitalDetailView alloc] init];
    detailView.frame = CGRectMake(0, 64, SCREENWIDTH, SCREENHEIGHT - 64);
    self.detailView = detailView;
    [self.view addSubview:detailView];
}
@end
