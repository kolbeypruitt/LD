//
//  DoctorStationDetailController.m
//  邻医家
//
//  Created by Daniel on 15/6/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "DoctorStationDetailController.h"
#import "DoctorStationDetail.h"
#import "DoctorStation.h"
#import "Common.h"
#import "StationDetailTool.h"
#import "StationDetailResult.h"
#import "CaseDetailParam.h"
#import "DocStationDetailView.h"
@interface DoctorStationDetailController ()
@property (nonatomic,weak) DocStationDetailView *detailView;
@property (nonatomic,strong) DoctorStationDetail *stationDetail;
@end

@implementation DoctorStationDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self addCustomView];
    [self loadData];
    
}
- (void)setup
{
    self.navigationItem.rightBarButtonItem =  nil;
    self.navigationItem.title = @"博士后站点";
    self.view.backgroundColor = IWColor(226, 226, 226);
}
- (void)addCustomView
{
    DocStationDetailView *detailView = [[DocStationDetailView alloc] init];
    detailView.frame = CGRectMake(0, 64, SCREENWIDTH, SCREENHEIGHT - 64);
    [self.view addSubview:detailView];
    self.detailView = detailView;
}
- (void)loadData
{
    CaseDetailParam *param = [CaseDetailParam paramWithId:self.doctorStation.id];
    [StationDetailTool stationDetailWithParam:param success:^(StationDetailResult *result) {
        self.stationDetail = result.postdoctorStation;
    } failure:^(NSError *error) {
        
    }];
}
- (void)setStationDetail:(DoctorStationDetail *)stationDetail
{
    _stationDetail = stationDetail;
    self.detailView.stationDetail = stationDetail;
}
@end
