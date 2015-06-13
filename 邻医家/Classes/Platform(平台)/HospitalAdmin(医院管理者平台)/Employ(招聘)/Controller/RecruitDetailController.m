//
//  RecruitDetailController.m
//  邻医家
//
//  Created by Daniel on 15/6/11.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "GetAllResumeTool.h"
#import "BaseResult.h"
#import "RecruitDetailController.h"
#import "GetAcceptedResumeTool.h"
#import "WithDrawTool.h"
#import "ConfirmedResumeController.h"
#import "GetAcceptedResult.h"
#import "GetEmployDetailTool.h"
#import "EmployDetailParam.h"
#import "Employee.h"
#import "EmployDetail.h"
#import "EmployDetailResult.h"
#import "UIBarButtonItem+ENTER.h"
#import "MBProgressHUD+MJ.h"
@interface RecruitDetailController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobtypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *departmentLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobname;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *educationLabel;
@property (weak, nonatomic) IBOutlet UILabel *englishLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *professionLabel;
@property (weak, nonatomic) IBOutlet UILabel *quantityLabel;
@property (weak, nonatomic) IBOutlet UIButton *acceptBtn;
@property (weak, nonatomic) IBOutlet UIButton *allBtn;
@property (nonatomic,strong) EmployDetail *employDetail;
@end

@implementation RecruitDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.title = @"招聘详情";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(withDraw) title:@"撤销"];
    [self.allBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.acceptBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)withDraw
{
    EmployDetailParam *param = [EmployDetailParam paramWithId:self.empl.id];
    [WithDrawTool withDrawResumeWithParam:param success:^(BaseResult *result) {
        if ([result.status isEqualToString:@"S"]) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    } failure:^(NSError *error) {
        [MBProgressHUD showError:@"撤销失败!"];
    }];
}
- (void)buttonClicked:(UIButton *)button
{
    if ([button isEqual:self.allBtn]) {
        EmployDetailParam *param = [EmployDetailParam paramWithId:self.empl.id];
        [GetAllResumeTool getAllResumWithParam:param success:^(GetAcceptedResult *result) {
            ConfirmedResumeController *allVC = [[ConfirmedResumeController alloc] init];
            allVC.employers = result.employers;
            allVC.title = @"所有的简历";
            [self.navigationController pushViewController:allVC animated:YES];
        } failure:^(NSError *error) {
            
        }];
    }else
    {
        EmployDetailParam *param = [EmployDetailParam paramWithId:self.empl.id];
        [GetAcceptedResumeTool getAcceptResumeWithParam:param success:^(GetAcceptedResult *result) {
            ConfirmedResumeController *acceptVC = [[ConfirmedResumeController alloc] init];
            acceptVC.employers = result.employers;
            acceptVC.title = @"已录取的简历";
            [self.navigationController pushViewController:acceptVC animated:YES];
        } failure:^(NSError *erro) {
            
        }];
    }
}

- (void)setEmpl:(Employee *)empl
{
    _empl = empl;
    EmployDetailParam *param = [EmployDetailParam paramWithId:empl.id];
    [GetEmployDetailTool getEmployDetailWithParam:param success:^(EmployDetailResult *result) {
        self.employDetail = [[EmployDetail alloc] init];
        self.employDetail = (EmployDetail *)result;
        [self updateUI];
    } failure:^(NSError *error) {
        
    }];
}
- (void)updateUI
{
    self.titleLabel.text = self.employDetail.title;
    self.jobtypeLabel.text = self.employDetail.jobtype;
    self.departmentLabel.text = self.employDetail.department;
    self.jobname.text = self.employDetail.jobname;
    self.locationLabel.text = self.employDetail.location;
    self.numberLabel.text = [NSString stringWithFormat:@"%d",self.employDetail.employNum];
    self.educationLabel.text = self.employDetail.education;
    self.englishLabel.text = self.employDetail.language;
    self.ageLabel.text = [NSString stringWithFormat:@"%d", self.employDetail.age];
    self.professionLabel.text = self.employDetail.profession;
    self.quantityLabel.text = self.employDetail.introduction;
    
    [self.acceptBtn setTitle:[NSString stringWithFormat:@"已录取%d简历",self.employDetail.accept]
                    forState:UIControlStateNormal];
    [self.allBtn setTitle:[NSString stringWithFormat:@"共收到%d简历",self.employDetail.all] forState:UIControlStateNormal];
}
@end
