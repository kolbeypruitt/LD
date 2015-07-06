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
@interface RecruitChildController ()

@end

@implementation RecruitChildController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}
#pragma mark - 加载数据
- (void)loadData
{
    LDBaseParam *param = [LDBaseParam param];
    [GetEmployTool getEmployWithParam:param success:^(GetEmployeeResult *result) {
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
}


@end
