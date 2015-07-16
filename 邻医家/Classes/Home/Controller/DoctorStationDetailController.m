//
//  DoctorStationDetailController.m
//  邻医家
//
//  Created by Daniel on 15/6/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDMessage.h"
#import "DoctorStationDetailController.h"
#import "DoctorStationDetail.h"
#import "DoctorStation.h"
#import "StationDetailTool.h"
#import "StationDetailResult.h"
#import "CaseDetailParam.h"
@interface DoctorStationDetailController ()
@property (nonatomic,strong) DoctorStationDetail *stationDetail;
@end

@implementation DoctorStationDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self loadData];
    
}
- (void)setup
{
    self.navigationItem.title = @"博士后站点";
    self.tableView.contentInset = UIEdgeInsetsMake(-30, 0, 0, 0);
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
    
    self.singleLine = YES;
    
    LDMessage *message0 = [LDMessage messageWithFirstTitle:@"学科名称" secondTitle:stationDetail.name];
    LDMessage *message1 = [LDMessage messageWithFirstTitle:@"联系方式" secondTitle:stationDetail.telnum];
    LDMessage *message2 = [LDMessage messageWithFirstTitle:@"地区" secondTitle:stationDetail.location];
    LDMessage *message3 = [LDMessage messageWithFirstTitle:@"详细地址" secondTitle:stationDetail.address];
    LDMessage *message4 = [LDMessage messageWithFirstTitle:@"所在机构" secondTitle:stationDetail.agency];
    self.messages = @[message0,message1,message2,message3,message4];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}

@end
