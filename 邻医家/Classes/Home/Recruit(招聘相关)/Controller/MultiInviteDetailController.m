//
//  MultiInviteDetailController.m
//  邻医家
//
//  Created by Daniel on 15/6/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "MultiInviteDetailController.h"
#import "Common.h"
#import "CaseDetailParam.h"
#import "RecruitDetailResult.h"
#import "RecruitDetailTool.h"
#import "LDMessage.h"
#import "EmployDetailInfo.h"
#import "EmployInfo.h"
@interface MultiInviteDetailController ()

@property (nonatomic,strong) EmployDetailInfo *detailInfo;
@end

@implementation MultiInviteDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self loadData];
}
- (void)setup
{
    self.tableView.contentInset = UIEdgeInsetsMake(-30, 0, 0, 0);
}
- (void)loadData
{
    CaseDetailParam *param = [CaseDetailParam paramWithId:self.employInfo.id];
    [RecruitDetailTool recruitDetailWithParam:param success:^(RecruitDetailResult *result) {
        self.detailInfo = result.employInfo;
    } failure:^(NSError *error) {
        
    }];
}
- (void)setDetailInfo:(EmployDetailInfo *)detailInfo
{
    _detailInfo = detailInfo;
    
    self.singleLine = YES;
    LDMessage *message0 = [LDMessage messageWithFirstTitle:@"岗位" secondTitle:detailInfo.jobname ];
    LDMessage *message1 = [LDMessage messageWithFirstTitle:@"地点" secondTitle:detailInfo.address ];
    LDMessage *message2 = [LDMessage messageWithFirstTitle:@"人数" secondTitle:[NSString stringWithFormat:@"%d",detailInfo.employNum] ];
    LDMessage *message3 = [LDMessage messageWithFirstTitle:@"学历" secondTitle:detailInfo.education ];
    LDMessage *message4 = [LDMessage messageWithFirstTitle:@"外语" secondTitle:detailInfo.language ];
    LDMessage *message5 = [LDMessage messageWithFirstTitle:@"年龄" secondTitle:[NSString stringWithFormat:@"%d",detailInfo.age] ];
    LDMessage *message6 = [LDMessage messageWithFirstTitle:@"专业" secondTitle:detailInfo.profession ];
    LDMessage *message7 = [LDMessage messageWithFirstTitle:@"职位要求" secondTitle:detailInfo.introduction ];
    LDMessage *message8 = [LDMessage messageWithFirstTitle:@"职位性质" secondTitle:detailInfo.jobtype];
    self.messages = @[message0,message1,message2,message3,message4,message5,message6,message7,message8];

}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}


@end
