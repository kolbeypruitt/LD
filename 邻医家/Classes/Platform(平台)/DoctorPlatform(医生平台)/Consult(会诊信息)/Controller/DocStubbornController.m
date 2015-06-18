//
//  DocStubbornController.m
//  邻医家
//
//  Created by Daniel on 15/6/13.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "UIBarButtonItem+ENTER.h"
#import "DocStubbornController.h"
#import "Common.h"
#import "MJExtension.h"
#import "DocConsultDetailParam.h"
#import "ConsultMessage.h"
#import "DocConsultDetailTool.h"
#import "DocStubbornModel.h"
@interface DocStubbornController ()
@property (weak, nonatomic) IBOutlet UILabel *caseAbstractLabel;
@property (weak, nonatomic) IBOutlet UILabel *illnessLabel;
@property (weak, nonatomic) IBOutlet UILabel *telnumLable;
@property (weak, nonatomic) IBOutlet UILabel *departmentLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *hospitalLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *ishospitalLabel;
@property (nonatomic,strong) DocStubbornModel *model;
@end

@implementation DocStubbornController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self setup];
}
- (void)setup
{
    self.navigationItem.title = @"会诊详情";
    self.view.backgroundColor = IWColor(226, 226, 226);
}
- (void)loadData
{
    DocConsultDetailParam *param = [DocConsultDetailParam paramWithId:self.message.id];
    [DocConsultDetailTool getDocConsultDetailWithParam:param success:^(id result) {
        self.model = [DocStubbornModel objectWithKeyValues:result];
        [self updateUI];
    } failure:^(NSError *error) {
        
    }];
}
- (void)updateUI
{
    NSString *condition = nil;
    if (self.model.gsstatus == 1) {
        condition = @"等待录取";
    }else if(self.model.gsstatus == 2)
    {
        condition = @"已录取";
    }
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:nil action:nil title:condition];
    
    self.telnumLable.text = self.model.telnum;
    self.departmentLabel.text = self.model.department;
    self.illnessLabel.text = self.model.illness;
    self.caseAbstractLabel.text = self.model.caseAbstract;
    self.locationLabel.text = self.model.location;
    self.addressLabel.text = self.model.address;
    self.hospitalLabel.text = self.model.hospital;
    self.jobTypeLabel.text = self.model.jobType;
    self.ishospitalLabel.text = self.model.ishospital;
    self.timeLabel.text = self.model.time;
}



@end
