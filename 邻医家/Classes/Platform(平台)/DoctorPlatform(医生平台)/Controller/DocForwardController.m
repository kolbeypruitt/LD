//
//  DocForwardController.m
//  邻医家
//
//  Created by Daniel on 15/6/13.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "DocForwordModel.h"
#import "Common.h"
#import "MJExtension.h"
#import "DocConsultDetailParam.h"
#import "DocConsultDetailTool.h"
#import "DocForwardController.h"
#import "ConsultMessage.h"
@interface DocForwardController ()
@property (weak, nonatomic) IBOutlet UILabel *telnumLabel;
@property (weak, nonatomic) IBOutlet UILabel *departmentLabel;
@property (weak, nonatomic) IBOutlet UILabel *patientLabel;
@property (weak, nonatomic) IBOutlet UILabel *identityLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastHospitalLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastDignoseLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationToGolabel;
@property (weak, nonatomic) IBOutlet UILabel *addressToGoLabel;
@property (weak, nonatomic) IBOutlet UILabel *professionLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *ishospitalLabel;
@property (weak, nonatomic) IBOutlet UILabel *isVipLabel;
@property (weak, nonatomic) IBOutlet UILabel *isfirstaidLabel;
@property (weak, nonatomic) IBOutlet UILabel *purposeLabel;

@property (nonatomic,strong) DocForwordModel *model;
@end

@implementation DocForwardController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = IWColor(226, 226, 226);
    [self loadData];
}
- (void)loadData
{
    DocConsultDetailParam *param = [DocConsultDetailParam paramWithId:self.message.id];
    [DocConsultDetailTool getDocConsultDetailWithParam:param success:^(id result) {
        self.model = [DocForwordModel objectWithKeyValues:result];
        [self updateUI];
    } failure:^(NSError *error) {
        
    }];
}
- (void)updateUI
{
    self.telnumLabel.text = self.model.telnum;
    self.isfirstaidLabel.text = self.model.idfirstaid;
    self.isVipLabel.text = self.model.isVIP;
    self.departmentLabel.text = self.model.department;
    self.patientLabel.text = self.model.patientName;
    self.identityLabel.text = self.model.idcardNo;
    self.lastHospitalLabel.text = self.model.lastHospitalDepartment;
    self.lastDignoseLabel.text = self.model.lastDiagnose;
    self.locationToGolabel.text = self.model.locationToGo;
    self.addressToGoLabel.text = self.model.addressToGo;
    self.professionLabel.text = self.model.profession;
    self.jobTypeLabel.text = self.model.jobType;
    self.ishospitalLabel.text = self.model.ishospital;
    self.purposeLabel.text = self.model.purpose;
}


@end
