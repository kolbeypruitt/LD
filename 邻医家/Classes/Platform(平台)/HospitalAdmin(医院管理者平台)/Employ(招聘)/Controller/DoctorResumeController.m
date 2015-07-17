//
//  DoctorResumeController.m
//  邻医家
//
//  Created by Daniel on 15/6/12.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "Common.h"
#import "DoctorResumeFooter.h"
#import "MBProgressHUD+MJ.h"
#import "ChatViewController.h"
#import "BaseResult.h"
#import "DoctorResumeView.h"
#import "DoctorResumeController.h"
#import "LDMessage.h"
#import "Employer.h"
#import "DoctorResumeTool.h"
#import "EmployDetailParam.h"
#import "InviteDoctorTool.h"
#import "DoctorResume.h"
#import "DoctorResumeResult.h"
@interface DoctorResumeController ()
@property (nonatomic,strong) DoctorResume  *resume;
@property (nonatomic,weak) DoctorResumeFooter *footer;
@end

@implementation DoctorResumeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self setup];
}
- (void)loadData
{
    EmployDetailParam *param = [EmployDetailParam paramWithId:self.employer.id];
    [DoctorResumeTool getDoctorResumeWithParam:param success:^(DoctorResumeResult *result) {
        self.resume = result.resume;
        self.title = result.resume.name;
    } failure:^(NSError *error) {
        
    }];
}
- (void)setResume:(DoctorResume *)resume
{
    _resume = resume;
    LDMessage *message0 = [LDMessage messageWithFirstTitle:@"医院" secondTitle:resume.hospital];
    LDMessage *message1 = [LDMessage messageWithFirstTitle:@"职称" secondTitle:resume.techtitle];
    LDMessage *message2 = [LDMessage messageWithFirstTitle:@"简介" secondTitle:resume.introduction];
    LDMessage *message3 = [LDMessage messageWithFirstTitle:@"科室" secondTitle:resume.department];
    LDMessage *message4 = [LDMessage messageWithFirstTitle:@"手机号" secondTitle:resume.telnum];
    LDMessage *message5 = [LDMessage messageWithFirstTitle:@"成果" secondTitle:resume.papers];
    LDMessage *message6 = [LDMessage messageWithFirstTitle:@"简历状态" secondTitle:@"hhhh"];
    self.messages = @[message0,message1,message2,message3,message4,message5,message6];
    int flag = 1;
    if (resume.resumeStatus == flag ) {//未录取
//        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
//        [button setBackgroundColor:IWColor(88, 202, 203)];
//        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [button setTitle:@"邀请此医生" forState:UIControlStateNormal];
//        button.titleLabel.font = [UIFont systemFontOfSize:15];
//        [button addTarget:self action:@selector(inviteBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        DoctorResumeFooter *footer = [[DoctorResumeFooter alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
        [footer.inviteBtn addTarget:self action:@selector(inviteBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        self.tableView.tableFooterView = footer;
    }
    
}
- (void)setup
{
    self.navigationItem.rightBarButtonItem = nil;
    self.tableView.contentInset = UIEdgeInsetsMake(-40, 0, 0, 0);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 2 || indexPath.row == 5) {
        NSString *title = nil;
        switch (indexPath.row) {
            case 2:
                title = self.resume.introduction;
                break;
            case 5:
                title = self.resume.papers;
                break;
        }
        CGRect rect = [title boundingRectWithSize:CGSizeMake(self.view.bounds.size.width - 120, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15] } context:nil];
        return rect.size.height + 30;
    }else
    {
        return 50;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIButton *contactBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 10, self.view.frame.size.width, 40)];
    contactBtn.backgroundColor = IWColor(88, 202, 203);
    contactBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    contactBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [contactBtn setTitle:@"联系发布人" forState:UIControlStateNormal];
    [contactBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [contactBtn addTarget:self action:@selector(chatBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    return  contactBtn;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 40;
}
#pragma resumeView delegate
- (void)inviteBtnClicked
{
    EmployDetailParam *param = [EmployDetailParam paramWithId:self.resume.id];
    [InviteDoctorTool inviteDoctorWithParam:param success:^(BaseResult *result) {
        if ([result.status isEqualToString:@"S"]) {
            int count = (int)self.navigationController.viewControllers.count;
            UIViewController *VC = [self.navigationController.viewControllers objectAtIndex:count-3];
            [self.navigationController popToViewController:VC animated:YES];
        }else
        {
            [MBProgressHUD showError:result.errorMsg];
        }
    } failure:^(NSError *error) {
        
    }];
    
}
- (void)chatBtnClicked:(UIButton *)chatBtn
{
    ChatViewController *chatVc = [[ChatViewController alloc] init];
    chatVc.clientToChat = self.resume.clientNumber;
    [self.navigationController pushViewController:chatVc animated:YES];
}
@end





















