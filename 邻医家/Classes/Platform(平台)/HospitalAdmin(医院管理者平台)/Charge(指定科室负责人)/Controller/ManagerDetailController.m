//
//  ManagerDetailController.m
//  邻医家
//
//  Created by Daniel on 15/7/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "ManagerDetailController.h"
#import "UIBarButtonItem+ENTER.h"
#import "ManagerDetailTool.h"
#import "ManagerDetailResult.h"
#import "LDBaseParam.h"
#import "DepartmentManager.h"
#import "ManagerDetail.h"
#import "DismissManagerTool.h"
#import "BaseResult.h"
#import "MBProgressHUD+MJ.h"
#import "Common.h"
#import "LDNotification.h"
@interface ManagerDetailController ()
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *fixphoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *mailLabel;
@property (weak, nonatomic) IBOutlet UILabel *departmentLabel;
@property (weak, nonatomic) IBOutlet UILabel *introducelabel;
@property (nonatomic,strong) ManagerDetail *managerDetail;
@end

@implementation ManagerDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(dismissManager) title:@"撤销"];
}
- (void)dismissManager
{
    LDBaseParam *parm = [LDBaseParam paramWithId:self.managerDetail.id];
    [DismissManagerTool dismissManagerWithParam:parm success:^(BaseResult *result) {
        if ([result.status isEqualToString:@"S"]) {
            [DefaultCenter postNotificationName:MANAGERLISTREFRESHNOTIFICATION object:self];
            [self.navigationController popViewControllerAnimated:YES];
        }else
        {
            [MBProgressHUD showError:@"撤销失败!"];
        }
    } failure:^(NSError *error) {
        [MBProgressHUD showError:@"撤销失败!"];
    }];
}

- (void)setManager:(DepartmentManager *)manager
{
    _manager = manager;
    [ManagerDetailTool managerDetailWithParam:[LDBaseParam paramWithId:manager.id] success:^(ManagerDetailResult *result) {
        if ([result.status isEqualToString:@"S"]) {
            self.managerDetail = result.info;
        }
    } failure:^(NSError *error) {
        
    }];
}
- (void)setManagerDetail:(ManagerDetail *)managerDetail
{
    _managerDetail = managerDetail;
    self.title = managerDetail.name;
    self.phoneLabel.text = managerDetail.telnum;
    self.fixphoneLabel.text = managerDetail.phone;
    self.mailLabel.text = managerDetail.mailbox;
    self.departmentLabel.text = managerDetail.department;
    self.introducelabel.text = managerDetail.introduction;
}
@end
















