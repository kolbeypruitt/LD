//
//  DepartmentDirectorController.m
//  邻医家
//
//  Created by Daniel on 15/6/6.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "DepartmentDirectorController.h"
#import "TemporaryController.h"
#import "FreeForwardController.h"
#import "UIBarButtonItem+ENTER.h"
#import "SurgeryViewController.h"
#import "StubbornViewController.h"

@interface DepartmentDirectorController () <UIActionSheetDelegate>

@end

@implementation DepartmentDirectorController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.title = @"科室主任平台";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNav];
}
- (void)setNav
{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(postConsultation) title:@"发布会诊"];
}
- (void)postConsultation
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"开刀",@"疑难杂症会诊",@"临时会诊",@"自由转诊", nil];
    [actionSheet showInView:self.view];
//    [actionSheet showFromBarButtonItem:self.navigationItem.rightBarButtonItem animated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    NSDate *date = [NSDate date];
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    formater.dateFormat = @"yy-MM-dd HH:mm:ss";
    NSString *dateStr = [formater stringFromDate:date];
    cell.textLabel.text = [NSString stringWithFormat:@"已发布开刀信息"];
    cell.detailTextLabel.text = dateStr;
    
    return cell;
}
#pragma mark - UIActionSheet Delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
        {
            SurgeryViewController *surgery = [[SurgeryViewController alloc] init];
            [self.navigationController pushViewController:surgery animated:YES];
            break;
        }
        case 1:
        {
            StubbornViewController *stubborn = [[StubbornViewController alloc] init];
            [self.navigationController pushViewController:stubborn animated:YES];
            break;
        }
        case 2:
        {
            TemporaryController *temporary = [[TemporaryController alloc] init];
            [self.navigationController pushViewController:temporary animated:YES];
            break;
        }
        case 3:
        {
            FreeForwardController *free = [[FreeForwardController alloc] init];
            [self.navigationController pushViewController:free animated:YES];
            break;
        }
        default:
            break;
    }
}


@end
