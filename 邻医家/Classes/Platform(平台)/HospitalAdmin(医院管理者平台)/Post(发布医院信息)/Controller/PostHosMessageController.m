//
//  PostHosMessageController.m
//  邻医家
//
//  Created by SXQ on 15/7/27.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "PostHosMessageCell.h"
#import "PostHosMessageController.h"
#import "PostHospitalController.h"
#import "PostCaseViewController.h"
#import "PostLectureController.h"
@interface PostHosMessageController ()
@property (nonatomic,strong) NSArray *hosmessages;
@end

@implementation PostHosMessageController
- (NSArray *)hosmessages
{
    if (_hosmessages == nil) {
        _hosmessages = @[@"发布医院简介",@"发布病例",@"发布讲座信息"];
    }
    return _hosmessages;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.hosmessages.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PostHosMessageCell *cell = [PostHosMessageCell cellWithTableView:tableView];
    cell.messageTitle.text = self.hosmessages[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            PostHospitalController *posthosVC = [[PostHospitalController alloc] init];
            [self.navigationController pushViewController:posthosVC animated:YES];
            break;
        }
        case 1:
        {
            PostCaseViewController *postCaseVC = [[PostCaseViewController alloc] init];
            [self.navigationController pushViewController:postCaseVC animated:YES];
            break;
        }
        case 2:
        {
            PostLectureController *postlectureVC = [[PostLectureController alloc] init];
            [self.navigationController pushViewController:postlectureVC animated:YES];
            break;
        }
        default:
            break;
    }
}

@end
