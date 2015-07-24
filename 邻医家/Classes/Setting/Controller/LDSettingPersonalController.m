//
//  LDSettingPersonalController.m
//  邻医家
//
//  Created by Daniel on 15/7/24.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "LDSettingPersonalController.h"
#import "LDBaseParam.h"
#import "UserTool.h"
#import "UserResult.h"
#import "LDMessage.h"
#import "LDUser.h"
@interface LDSettingPersonalController ()
@property (nonatomic,strong) LDUser *user;
@end

@implementation LDSettingPersonalController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(-30, 0, 0, 0);
    [self loadUserData];
}

- (void)loadUserData
{
    LDBaseParam *param = [LDBaseParam param];
    [UserTool userWithParam:param success:^(UserResult *result) {
        if ([result.status isEqualToString:@"S"]) {
            self.user = result.account;
        }
    } failure:^(NSError *error) {
        
    }];
}
- (void)setUser:(LDUser *)user
{
    _user = user;
    NSMutableArray *tmpMessages = [NSMutableArray array];
    LDMessage *message0 = [LDMessage messageWithFirstTitle:@"手机号" secondTitle:user.telnum];
    [tmpMessages addObject:message0];
    if (user.phone) {
        LDMessage *message = [LDMessage messageWithFirstTitle:@"联系方式" secondTitle:user.phone];
        [tmpMessages addObject:message];
    }
    if (user.name) {
        LDMessage *message = [LDMessage messageWithFirstTitle:@"医院名称" secondTitle:user.name];
        [tmpMessages addObject:message];
    }
    if (user.address) {
        LDMessage *message = [LDMessage messageWithFirstTitle:@"医院地址" secondTitle:user.address];
        [tmpMessages addObject:message];
    }
    if (user.level) {
        LDMessage *message = [LDMessage messageWithFirstTitle:@"医院等级" secondTitle:user.level];
        [tmpMessages addObject:message];
    }
    if (user.founddate) {
        LDMessage *message = [LDMessage messageWithFirstTitle:@"创建时间" secondTitle:user.founddate];
        [tmpMessages addObject:message];
    }
    if (user.realname) {
        LDMessage *message = [LDMessage messageWithFirstTitle:@"真实姓名" secondTitle:user.realname];
        [tmpMessages addObject:message];
    }
    if (user.website) {
        LDMessage *message = [LDMessage messageWithFirstTitle:@"医院网址" secondTitle:user.website];
        [tmpMessages addObject:message];
    }
    if (user.contact) {
        LDMessage *message = [LDMessage messageWithFirstTitle:@"座机号" secondTitle:user.contact];
        [tmpMessages addObject:message];
    }
    
    
    if (user.hospital) {
        LDMessage *message = [LDMessage messageWithFirstTitle:@"医院名称" secondTitle:user.hospital];
        [tmpMessages addObject:message];
    }
    
    
    if (user.department) {
        LDMessage *message = [LDMessage messageWithFirstTitle:@"科室" secondTitle:user.department];
        [tmpMessages addObject:message];
    }
    if (user.gender) {
        LDMessage *message = [LDMessage messageWithFirstTitle:@"性别" secondTitle:user.gender];
        [tmpMessages addObject:message];
    }
    
    if (user.idcardNo) {
        LDMessage *message = [LDMessage messageWithFirstTitle:@"身份证号" secondTitle:user.idcardNo];
        [tmpMessages addObject:message];
    }
    if (user.location) {
        LDMessage *message = [LDMessage messageWithFirstTitle:@"地区" secondTitle:user.location];
        [tmpMessages addObject:message];
    }
    
    if (user.illness) {
        LDMessage *message = [LDMessage messageWithFirstTitle:@"疾病名称" secondTitle:user.illness];
        [tmpMessages addObject:message];
    }
    if (user.mailbox) {
        LDMessage *message = [LDMessage messageWithFirstTitle:@"邮箱" secondTitle:user.mailbox];
        [tmpMessages addObject:message];
    }
    
    if (user.introduction) {
        LDMessage *message = [LDMessage messageWithFirstTitle:@"医院简介" secondTitle:user.introduction];
        [tmpMessages addObject:message];
    }
    self.messages = [tmpMessages copy];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == self.messages.count) {
        return 100;
    }else
    {
        return [super tableView:tableView heightForRowAtIndexPath:indexPath];
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}
@end
