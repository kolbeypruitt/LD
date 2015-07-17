//
//  ConsultDetailController.m
//  邻医家
//
//  Created by Daniel on 15/6/19.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "ListResult.h"
#import "AllResumeViewController.h"
#import "LDMessageHeader.h"
#import "DepartmentListToll.h"
#import "LDMessage.h"
#import "WithDrawConsultTool.h"
#import "UIBarButtonItem+ENTER.h"
#import "ConsultDetailController.h"
#import "ConsultMessage.h"
#import "ConsultDetailTool.h"
#import "ConsultDetailParam.h"
#import "ConsutlDetailResult.h"
#import "SurgeryModel.h"
#import "Common.h"
#import "StubbornModel.h"
#import "TemporaryModel.h"
#import "ForwardModel.h"
#import "BaseResult.h"
#import "LDNotification.h"
@interface ConsultDetailController ()
@property (nonatomic,strong) SurgeryModel *surgeryModel;
@property (nonatomic,strong) StubbornModel *stubbornModel;
@property (nonatomic,strong) TemporaryModel *temModel;
@property (nonatomic,strong) ForwardModel *forModel;
@property (nonatomic,strong) ConsutlDetailResult *result;
@property (nonatomic,weak) LDMessageHeader *headView;
@end

@implementation ConsultDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self loadData];
}
- (void)setup
{
    self.navigationItem.title = @"招聘详情";
    self.view.backgroundColor = IWColor(226, 226, 226);
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(withDraw) title:@"撤销"];
}
- (void)withDraw
{
    ConsultDetailParam *param = [ConsultDetailParam paramWithId:self.message.id];
    [WithDrawConsultTool withDrawConsultWithParam:param success:^(BaseResult *result) {
        if ([result.status isEqualToString:SUCCESSSTATUS]) {
            [DefaultCenter postNotificationName:DEPARTMENTMSGREFRESHNOTIFICATION object:self];
            [self.navigationController popViewControllerAnimated:YES];
        }
    } failure:^(NSError *error) {
        
    }];
}

- (void)loadData
{
    ConsultDetailParam *param = [ConsultDetailParam paramWithId:self.message.id];
    [ConsultDetailTool consultDetailWithParam:param success:^(ConsutlDetailResult *result) {
        self.result = result;
    } failure:^(NSError *error) {
        
    }];
}
- (void)setResult:(ConsutlDetailResult *)result
{
    _result = result;
    self.singleLine = NO;
    LDMessageHeader *inviteHeader = [[LDMessageHeader alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,80)];
    [inviteHeader.allBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [inviteHeader.acceptBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    inviteHeader.consultResult = result;
    self.headView = inviteHeader;
    self.tableView.tableHeaderView = inviteHeader;
    
    if (result.type == 1)
    {//开刀
        self.surgeryModel = (SurgeryModel *)result;
    }else if(result.type == 2)
    {//疑难杂症
        self.stubbornModel = (StubbornModel *)result;
    }else if(result.type == 3)
    {//临时会诊
        self.temModel = (TemporaryModel *)result;
    }else if(result.type == 4)
    {//转诊
        self.forModel = (ForwardModel *)result;
    }
}
- (void)setSurgeryModel:(SurgeryModel *)surgeryModel
{
    _surgeryModel = surgeryModel;
    LDMessage *message0 = [LDMessage messageWithFirstTitle:@"科室" secondTitle:surgeryModel.department];
    LDMessage *message1 = [LDMessage messageWithFirstTitle:@"疾病名称" secondTitle:surgeryModel.illness];
    LDMessage *message2 = [LDMessage messageWithFirstTitle:@"手术名称" secondTitle:surgeryModel.opreationName];
    LDMessage *message3 = [LDMessage messageWithFirstTitle:@"手术台数" secondTitle:[NSString stringWithFormat:@"%d",surgeryModel.operationNum]];
    LDMessage *message4 = [LDMessage messageWithFirstTitle:@"手术约定时间" secondTitle:surgeryModel.time];
    LDMessage *message5 = [LDMessage messageWithFirstTitle:@"手术约定地址" secondTitle:surgeryModel.location];
    LDMessage *message6 = [LDMessage messageWithFirstTitle:@"详细地址" secondTitle:surgeryModel.address];
    LDMessage *message7 = [LDMessage messageWithFirstTitle:@"医院名称" secondTitle:surgeryModel.hospital];
    LDMessage *message8 = [LDMessage messageWithFirstTitle:@"拟邀医生技术职位" secondTitle:surgeryModel.jobType];
    LDMessage *message9 = [LDMessage messageWithFirstTitle:@"是否住院" secondTitle:surgeryModel.ishospital];
    self.messages = @[message0,message1,message2,message3,message4,message5,message6,message7,message8,message9];
}
- (void)setStubbornModel:(StubbornModel *)stubbornModel
{
    _stubbornModel = stubbornModel;
    LDMessage *message0 = [LDMessage messageWithFirstTitle:@"科室" secondTitle:stubbornModel.department];
    LDMessage *message1 = [LDMessage messageWithFirstTitle:@"待查疾病名称" secondTitle:stubbornModel.illness];
    LDMessage *message2 = [LDMessage messageWithFirstTitle:@"患者病例摘要" secondTitle:stubbornModel.caseAbstract];
    LDMessage *message3 = [LDMessage messageWithFirstTitle:@"会诊约定时间" secondTitle:stubbornModel.time];
    LDMessage *message4 = [LDMessage messageWithFirstTitle:@"会诊约定地址" secondTitle:stubbornModel.location];
    LDMessage *message5 = [LDMessage messageWithFirstTitle:@"详细地址" secondTitle:stubbornModel.address];
    LDMessage *message6 = [LDMessage messageWithFirstTitle:@"医院名称" secondTitle:stubbornModel.hospital];
    LDMessage *message7 = [LDMessage messageWithFirstTitle:@"拟邀医生技术职位" secondTitle:stubbornModel.jobType];
    LDMessage *message8 = [LDMessage messageWithFirstTitle:@"是否住院" secondTitle:stubbornModel.ishospital];
    self.messages = @[message0,message1,message2,message3,message4,message5,message6,message7,message8];
}
- (void)setTemModel:(TemporaryModel *)temModel
{
    _temModel = temModel;
    LDMessage *message0 = [LDMessage messageWithFirstTitle:@"科室" secondTitle:temModel.department];
    LDMessage *message1 = [LDMessage messageWithFirstTitle:@"临时会诊时间" secondTitle:temModel.time];
    LDMessage *message2 = [LDMessage messageWithFirstTitle:@"临时坐诊地址" secondTitle:temModel.location];
    LDMessage *message3 = [LDMessage messageWithFirstTitle:@"详细地址" secondTitle:temModel.address];
    LDMessage *message4 = [LDMessage messageWithFirstTitle:@"医院名称" secondTitle:temModel.hospital];
    LDMessage *message5 = [LDMessage messageWithFirstTitle:@"拟邀医生技术职位" secondTitle:temModel.jobType];
    LDMessage *message6 = [LDMessage messageWithFirstTitle:@"是否住院" secondTitle:temModel.ishospital];
    self.messages = @[message0,message1,message2,message3,message4,message5,message6];
}
- (void)setForModel:(ForwardModel *)forModel
{
    _forModel = forModel;
    LDMessage *message0 = [LDMessage messageWithFirstTitle:@"科室" secondTitle:forModel.department];
    LDMessage *message1 = [LDMessage messageWithFirstTitle:@"病人姓名" secondTitle:forModel.patientName];
    LDMessage *message2 = [LDMessage messageWithFirstTitle:@"身份证号" secondTitle:forModel.idcardNo];
    LDMessage *message3 = [LDMessage messageWithFirstTitle:@"最后一次就医医院" secondTitle:forModel.lastHospitalDepartment];
    LDMessage *message4 = [LDMessage messageWithFirstTitle:@"最后一次疾病诊断" secondTitle:forModel.lastDiagnose];
    LDMessage *message5 = [LDMessage messageWithFirstTitle:@"拟转诊就医地址" secondTitle:forModel.locationToGo];
    LDMessage *message6 = [LDMessage messageWithFirstTitle:@"详细地址" secondTitle:forModel.addressToGo];
    LDMessage *message7 = [LDMessage messageWithFirstTitle:@"接诊医师的专业" secondTitle:forModel.profession];
    LDMessage *message8 = [LDMessage messageWithFirstTitle:@"接诊医师的职务" secondTitle:forModel.jobType];
    LDMessage *message9 = [LDMessage messageWithFirstTitle:@"是否住院" secondTitle:forModel.ishospital];
    LDMessage *message10 = [LDMessage messageWithFirstTitle:@"转诊的目的" secondTitle:forModel.purpose];
    LDMessage *message11 = [LDMessage messageWithFirstTitle:@"是否需要VIP" secondTitle:forModel.isVIP];
    LDMessage *message12 = [LDMessage messageWithFirstTitle:@"是否需要抢救" secondTitle:forModel.idfirstaid];
    self.messages =  @[message0,message1,message2,message3,message4,message5,message6,message7,message8,message9,message10,message11,message12];
}
#pragma mark - Button events
- (void)buttonClicked:(UIButton *)button
{
    LDBaseParam *param = [LDBaseParam paramWithId:self.message.id];
    if ([button isEqual:self.headView.allBtn]) {
        [DepartmentListToll allListWithParam:param success:^(ListResult *result) {
            if ([result.status isEqualToString:@"S"]) {
                if (result.employers.count > 0) {
                    AllResumeViewController *allVC = [[AllResumeViewController alloc] init];
                    allVC.title = @"所有简历";
                    allVC.doctors = result.employers;
                    [self.navigationController pushViewController:allVC animated:YES];
                }
            }
        } failure:^(NSError *error) {
            
        }];
    }else
    {
        [DepartmentListToll acceptedWithParam:param success:^(ListResult *result) {
            if ([result.status isEqualToString:@"S"]) {
                if (result.employers.count > 0) {
                    AllResumeViewController *allVC = [[AllResumeViewController alloc] init];
                    allVC.title = @"录取简历";
                    allVC.doctors = result.employers;
                    [self.navigationController pushViewController:allVC animated:YES];
                }
            }
        } failure:^(NSError *error) {
            
        }];
    }
}
#pragma mark - tabelview delegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}
@end
