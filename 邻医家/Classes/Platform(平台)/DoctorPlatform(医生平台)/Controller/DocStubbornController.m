//
//  DocStubbornController.m
//  邻医家
//
//  Created by Daniel on 15/6/13.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

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
    self.view.backgroundColor = IWColor(226, 226, 226);
    [self loadData];
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
