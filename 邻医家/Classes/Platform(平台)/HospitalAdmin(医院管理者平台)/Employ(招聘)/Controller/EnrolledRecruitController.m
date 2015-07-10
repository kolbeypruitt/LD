//
//  EnrolledRecruitController.m
//  邻医家
//
//  Created by Daniel on 15/7/10.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "List.h"
#import "Common.h"
#import "EnrolledRecruitController.h"
#import "GetEmployTool.h"
#import "LDBaseParam.h"
#import "GetEmployeeResult.h"
@implementation EnrolledRecruitController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self setupChild];
}
- (void)setupChild
{
    self.title = @"已录取招聘列表";
    self.navigationItem.rightBarButtonItem = nil;
}
#pragma mark - 加载数据
- (void)loadData
{
    LDBaseParam *param = [LDBaseParam param];
    [GetEmployTool getEmployWithParam:param url:GETSUCCESSEDEMPLOYURL success:^(GetEmployeeResult *result) {
        for (List *list in result.employs){
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
@end
