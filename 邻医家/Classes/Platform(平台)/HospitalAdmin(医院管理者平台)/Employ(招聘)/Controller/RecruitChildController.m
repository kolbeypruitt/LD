//
//  RecruitChildController.m
//  邻医家
//
//  Created by Daniel on 15/7/6.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "List.h"
#import "RecruitChildController.h"
#import "GetEmployTool.h"
#import "LDBaseParam.h"
#import "GetEmployeeResult.h"
#import "Common.h"
#import "LDNotification.h"
#import "AppendRecruitController.h"
@interface RecruitChildController ()

@end

@implementation RecruitChildController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNotificaiton];
    [self loadData];
}
- (void)setupNotificaiton
{
    [DefaultCenter addObserver:self selector:@selector(loadData) name:APPENDRECRUITSUCCESSNOTIFICATION object:nil];
}
- (void)dealloc
{
    [DefaultCenter removeObserver:self];
}
#pragma mark - 加载数据
- (void)loadData
{
    LDBaseParam *param = [LDBaseParam param];
    [GetEmployTool getEmployWithParam:param url:GETEMPLOYURL success:^(GetEmployeeResult *result) {
        for (List *list in result.employs) {
            switch (list.type) {
                case 1://全职
                    self.fulltimeDatas = list.list;
                    break;
                case 2://兼职
                    self.parttimeDatas = list.list;
                    break;
                case 3://实习
                    self.practiceDatas = list.list;
                    break;
                case 4://进修
                    self.studyDatas = list.list;
                    break;
                case 5://博士
                    self.doctorDatas = list.list;
                    break;
                    
                default:
                    break;
            }
        }
    } failure:^(NSError *error) {
        
    }];
    
}
#pragma mark - 添加招聘信息
- (void)appendRecruit
{
    AppendRecruitController *appendVC = [[AppendRecruitController alloc]  init];
    [self.navigationController pushViewController:appendVC animated:YES];
}


@end
