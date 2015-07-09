//
//  ArrangementDetailController.m
//  邻医家
//
//  Created by Daniel on 15/7/9.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "ArrangementDetailController.h"
#import "Common.h"
#import "LDBaseParam.h"
#import "ArrangementDetailTool.h"
#import "ArrangementDetail.h"
#import "Arrangement.h"
#import "ArrangementDetailResult.h"
@interface ArrangementDetailController ()
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *departmentLabel;
@property (weak, nonatomic) IBOutlet UILabel *techLabel;
@property (nonatomic,strong) ArrangementDetail *detail;
@end

@implementation ArrangementDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.view.backgroundColor = BGCOLOR;
}

- (void)setArrangement:(Arrangement *)arrangement
{
    _arrangement = arrangement;
    LDBaseParam *param = [LDBaseParam paramWithId:arrangement.id];
    [ArrangementDetailTool arrangementWithParam:param success:^(ArrangementDetailResult *result) {
        if ([result.status isEqualToString:SUCCESSSTATUS]) {
            self.detail = result.arrangements;
        }
    } failure:^(NSError *errro) {
        
    }];
}
- (void)setDetail:(ArrangementDetail *)detail
{
    _detail = detail;
    self.title = detail.name;
    self.timeLabel.text = detail.time;
    self.departmentLabel.text = detail.department;
    self.techLabel.text = detail.techtitle;
}
@end
