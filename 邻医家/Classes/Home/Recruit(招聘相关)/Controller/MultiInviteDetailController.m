//
//  MultiInviteDetailController.m
//  邻医家
//
//  Created by Daniel on 15/6/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "ApplianTool.h"
#import "LDBaseParam.h"
#import "BaseResult.h"
#import "MultiInviteDetailController.h"
#import "Common.h"
#import "CaseDetailParam.h"
#import "RecruitDetailResult.h"
#import "RecruitDetailTool.h"
#import "LDMessage.h"
#import "EmployDetailInfo.h"
#import "EmployInfo.h"
#import "UIButton+LD.h"
#import "MBProgressHUD+MJ.h"
#import "Account.h"
#import "AccountTool.h"
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
    if (self.type == 1 || self.type == 2) {
        Account *acc = [AccountTool account];
        if (acc.type == 2) {
            [self setTableFooter];
        }
    }
    
}
- (void)setTableFooter
{
    UIButton *footer = [UIButton buttonWithTitle:@"应聘" font:15 titleColor:[UIColor whiteColor] target:self action:@selector(applyRecruit)];
    footer.frame = CGRectMake(0, 0, self.view.frame.size.width, 40);
    [footer setBackgroundColor:IWColor(88, 202, 203)];
    self.tableView.tableFooterView = footer;
}
- (void)applyRecruit
{
    LDBaseParam *param = [LDBaseParam paramWithId:self.employInfo.id];
   [ApplianTool applyForMultyAndExpertWithParam:param success:^(BaseResult *result) {
       if ([result.status isEqualToString:@"S"]) {
           [self.navigationController popViewControllerAnimated:YES];
       }else
       {
           [MBProgressHUD showError:result.errorMsg];
       }
   } failure:^(NSError *error) {
       
   }];
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
    LDMessage *message9 = [LDMessage messageWithFirstTitle:@"编号" secondTitle:detailInfo.code];
    self.messages = @[message0,message1,message2,message3,message4,message5,message6,message7,message8,message9];

}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}


@end
