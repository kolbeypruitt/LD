//
//  ArrangementDetailController.m
//  邻医家
//
//  Created by Daniel on 15/7/9.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "ArrangementDetailController.h"
#import "LDMessage.h"
#import "Common.h"
#import "LDBaseParam.h"
#import "ArrangementDetailTool.h"
#import "ArrangementDetail.h"
#import "Arrangement.h"
#import "ArrangementDetailResult.h"
@interface ArrangementDetailController ()
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
    self.singleLine = YES;

    LDMessage *message0 = [LDMessage messageWithFirstTitle:@"坐诊时间" secondTitle:detail.time];
    LDMessage *message1 = [LDMessage messageWithFirstTitle:@"科室" secondTitle:detail.department];
    LDMessage *message2 = [LDMessage messageWithFirstTitle:@"医师" secondTitle:detail.techtitle];
    self.messages = @[message0,message1,message2];
 
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}
@end
