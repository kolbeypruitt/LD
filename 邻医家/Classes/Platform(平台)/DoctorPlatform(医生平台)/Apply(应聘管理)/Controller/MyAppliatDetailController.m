//
//  MyAppliatDetailController.m
//  邻医家
//
//  Created by Daniel on 15/7/12.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "UIBarButtonItem+ENTER.h"
#import "MyAppliatDetailController.h"
#import "ApplianTool.h"
#import "LDMessageLabel.h"
#import "Common.h"
#import "EmployDetail.h"
#import "LDBaseParam.h"
#import "EmployInfo.h"
#import "ChatViewController.h"
@interface MyAppliatDetailController ()
@property (weak, nonatomic) IBOutlet LDMessageLabel *titleMes;
@property (weak, nonatomic) IBOutlet LDMessageLabel *jobtype;
@property (weak, nonatomic) IBOutlet LDMessageLabel *department;
@property (weak, nonatomic) IBOutlet LDMessageLabel *jobname;
@property (weak, nonatomic) IBOutlet LDMessageLabel *location;
@property (weak, nonatomic) IBOutlet LDMessageLabel *employNum;
@property (weak, nonatomic) IBOutlet LDMessageLabel *education;
@property (weak, nonatomic) IBOutlet LDMessageLabel *laguage;
@property (weak, nonatomic) IBOutlet LDMessageLabel *age;
@property (weak, nonatomic) IBOutlet LDMessageLabel *profession;
@property (weak, nonatomic) IBOutlet LDMessageLabel *qualification;
@property (weak, nonatomic) IBOutlet UIButton *contactBtn;
@property (nonatomic,strong) EmployDetail *employDetail;
@end

@implementation MyAppliatDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self loadData];
    [self setup];
}
- (void)loadData
{
    LDBaseParam *param = [LDBaseParam paramWithId:self.empinfo.id];
    [ApplianTool myAppliantWithParam:param success:^(AppliantDetailResult *result) {
        if ([result.status isEqualToString:SUCCESSSTATUS]) {
            self.employDetail = result.employInfo;
        }
    } failure:^(NSError *error) {
        
    }];
}
- (void)setEmployDetail:(EmployDetail *)employDetail
{
    _employDetail = employDetail;
    self.titleMes.secondLabel.text = employDetail.title;
    self.jobtype.secondLabel.text = employDetail.jobtype;
    self.department.secondLabel.text = employDetail.department;
    self.jobname.secondLabel.text = employDetail.jobname;
    self.location.secondLabel.text = employDetail.location;
    self.employNum.secondLabel.text =[NSString stringWithFormat:@"%d",employDetail.employNum];
    self.education.secondLabel.text = employDetail.education;
    self.laguage.secondLabel.text = employDetail.language;
    self.age.secondLabel.text =[NSString stringWithFormat:@"%d", employDetail.age];
    self.profession.secondLabel.text = employDetail.profession;
    self.qualification.secondLabel.text = employDetail.introduction;
    
    NSString *title = nil;
    if (employDetail.status == 1) {
        title = @"未录取";
    }else if (employDetail.status == 2)
    {
        title = @"已录取";
    }
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:nil action:nil title:title];
    
}
- (void)setup
{
    self.title = @"招聘详情";
    self.view.backgroundColor = BGCOLOR;
    [self.contactBtn setTitleColor:IWColor(88, 202, 203) forState:UIControlStateNormal];
    
    self.titleMes.firstLabel.text = @"标题";
    self.jobtype.firstLabel.text = @"职位性质";
    self.department.firstLabel.text = @"科室";
    self.jobname.firstLabel.text = @"岗位";
    self.location.firstLabel.text = @"地点";
    self.employNum.firstLabel.text = @"人数";
    self.education.firstLabel.text = @"学历";
    self.laguage.firstLabel.text = @"外语";
    self.age.firstLabel.text = @"年龄";
    self.profession.firstLabel.text = @"专业";
    self.qualification.firstLabel.text = @"招聘条件";
    
    
}
- (IBAction)contact {
    ChatViewController *chatVC = [[ChatViewController alloc] init];
    chatVC.clientToChat = self.employDetail.clientNumber;
    [self.navigationController pushViewController:chatVC animated:YES];
}
@end
