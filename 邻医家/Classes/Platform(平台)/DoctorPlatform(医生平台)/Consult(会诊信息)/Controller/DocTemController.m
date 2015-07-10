//
//  DocTemController.m
//  邻医家
//
//  Created by Daniel on 15/6/13.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "ChatViewController.h"
#import "UIBarButtonItem+ENTER.h"
#import "DocTemModel.h"
#import "DocTemController.h"
#import "MJExtension.h"
#import "Common.h"
#import "DocConsultDetailParam.h"
#import "ConsultMessage.h"
#import "DocConsultDetailTool.h"
@interface DocTemController ()
@property (nonatomic,strong) DocTemModel *model;
@property (weak, nonatomic) IBOutlet UILabel *telnumLabel;
@property (weak, nonatomic) IBOutlet UILabel *departmentLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *hospitalLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobtypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *ishospitalLabel;

@end

@implementation DocTemController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self setup];
}
- (void)setup
{
    self.navigationItem.title = @"临时会诊详情";
    self.view.backgroundColor = IWColor(226, 226, 226);
}
- (void)loadData
{
    DocConsultDetailParam *param = [DocConsultDetailParam paramWithId:self.message.id];
    [DocConsultDetailTool getDocConsultDetailWithParam:param success:^(id result) {
        self.model = [DocTemModel objectWithKeyValues:result];
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
    
    self.telnumLabel.text = self.model.telnum;
    self.departmentLabel.text = self.model.department;
    self.timeLabel.text = self.model.time;
    self.locationLabel.text = self.model.location;
    self.addressLabel.text = self.model.address;
    self.hospitalLabel.text = self.model.hospital;
    self.jobtypeLabel.text = self.model.jobType;
    self.ishospitalLabel.text = self.model.ishospital;
}
- (IBAction)contact:(id)sender {
    ChatViewController *chatVc = [[ChatViewController alloc] init];
    chatVc.clientToChat = self.model.clientNumber;
    [self.navigationController pushViewController:chatVc animated:YES];
}
@end
