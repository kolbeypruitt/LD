//
//  ManagerDetailController.m
//  邻医家
//
//  Created by Daniel on 15/7/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDMessage.h"
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
    self.singleLine = YES;
    
    LDMessage *message0 = [LDMessage messageWithFirstTitle:@"手机号" secondTitle:managerDetail.telnum];
    LDMessage *message1 = [LDMessage messageWithFirstTitle:@"座机号" secondTitle:managerDetail.phone];
    LDMessage *message2 = [LDMessage messageWithFirstTitle:@"邮箱" secondTitle:managerDetail.mailbox];
    LDMessage *message3 = [LDMessage messageWithFirstTitle:@"科室" secondTitle:managerDetail.department];
    LDMessage *message4 = [LDMessage messageWithFirstTitle:@"科室简介" secondTitle:managerDetail.introduction];
    self.messages = @[message0,message1,message2,message3,message4];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}
@end
















