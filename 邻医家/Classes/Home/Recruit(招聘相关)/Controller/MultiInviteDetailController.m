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
#import "EmployDetailInfo.h"
#import "EmployInfo.h"
@interface MultiInviteDetailController ()
@property (weak, nonatomic) IBOutlet UILabel *languageLabel;
@property (weak, nonatomic) IBOutlet UILabel *educationLabel;
@property (weak, nonatomic) IBOutlet UILabel *employNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobnameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *professionLabel;
@property (weak, nonatomic) IBOutlet UILabel *monthlyLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *workAgeLabel;
@property (weak, nonatomic) IBOutlet UILabel *techTitleLabel;
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
    self.navigationItem.title = @"多点执业邀请";
    self.navigationItem.rightBarButtonItem = nil;
    self.view.backgroundColor = IWColor(226, 226, 226);
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
    self.jobnameLabel.text = detailInfo.jobname;
    self.addressLabel.text = detailInfo.address;
    self.employNumLabel.text = [NSString stringWithFormat:@"%d",detailInfo.employNum];
    self.educationLabel.text = detailInfo.education;
    self.languageLabel.text = detailInfo.language;
    self.ageLabel.text = [NSString stringWithFormat:@"%d",detailInfo.age];
    self.professionLabel.text = detailInfo.profession;
    self.monthlyLabel.text = detailInfo.monthly;
    self.workAgeLabel.text =[NSString stringWithFormat:@"%d", detailInfo.workage];
    self.jobTypeLabel.text = detailInfo.jobtype;
    self.techTitleLabel.text = detailInfo.techtitle;
}



@end
