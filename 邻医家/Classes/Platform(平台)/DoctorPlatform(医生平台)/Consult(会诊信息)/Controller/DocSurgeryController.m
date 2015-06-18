//
//  DocSurgeryController.m
//  邻医家
//
//  Created by Daniel on 15/6/13.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "DocConsultDetailTool.h"
#import "UIBarButtonItem+ENTER.h"
#import "DocConsultDetailParam.h"
#import "DocSurgeryController.h"
#import "ConsultMessage.h"
#import "MJExtension.h"
#import "DocSurgeryModel.h"
#import "Common.h"
@interface DocSurgeryController ()
@property (weak, nonatomic) IBOutlet UILabel *telnumLabel;
@property (weak, nonatomic) IBOutlet UILabel *departmentLabel;
@property (weak, nonatomic) IBOutlet UILabel *illnessLabel;
@property (weak, nonatomic) IBOutlet UILabel *operationLabel;
@property (weak, nonatomic) IBOutlet UILabel *operationNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *hospitalLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *ishospitalLabel;
@property (nonatomic,strong) DocSurgeryModel *model;
@end

@implementation DocSurgeryController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self setup];
}
- (void)setup
{
    self.navigationItem.title = @"会诊详情";
}
- (void)loadData
{
    DocConsultDetailParam *param = [DocConsultDetailParam paramWithId:self.message.id];
    [DocConsultDetailTool getDocConsultDetailWithParam:param success:^(id result) {
        self.model = [DocSurgeryModel objectWithKeyValues:result];
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
    
    self.view.backgroundColor = IWColor(226, 226, 226);
    self.telnumLabel.text = self.model.telnum;
    self.departmentLabel.text = self.model.department;
    self.illnessLabel.text = self.model.illness;
    self.operationLabel.text = self.model.operationName;
    self.operationNumLabel.text = [NSString stringWithFormat:@"%d",self.model.operationNum];
    self.timeLabel.text = self.model.time;
    self.locationLabel.text = self.model.location;
    self.addressLabel.text = self.model.address;
    self.hospitalLabel.text= self.model.hospital;
    self.jobTypeLabel.text = self.model.jobType;
    self.ishospitalLabel.text = self.model.ishospital;
}
@end







