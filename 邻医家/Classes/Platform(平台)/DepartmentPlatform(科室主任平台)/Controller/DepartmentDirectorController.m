//
//  DepartmentDirectorController.m
//  邻医家
//
//  Created by Daniel on 15/6/6.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "ConsultDetailController.h"
#import "ConsultMessage.h"
#import "ConsultDetailController.h"
#import "DepartmentDirectorController.h"
#import "TemporaryController.h"
#import "ConsultDetailParam.h"
#import "FreeForwardController.h"
#import "UIBarButtonItem+ENTER.h"
#import "SurgeryViewController.h"
#import "StubbornViewController.h"
#import "LDBaseParam.h"
#import "QueryConsultTool.h"
#import "QueryConsultResult.h"
@interface DepartmentDirectorController () <UIActionSheetDelegate>
/**
 *  ConsultMessage模型数组
 */
@property (nonatomic,strong) NSMutableArray *datas;
@end

@implementation DepartmentDirectorController
- (NSMutableArray *)datas
{
    if (_datas == nil) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self setup];
}
- (void)loadData
{
    LDBaseParam *param = [LDBaseParam param];
    [QueryConsultTool queryConsultWithParam:param success:^(QueryConsultResult *result) {
        [self.datas addObjectsFromArray:result.gs];
        [self.tableView reloadData];
    } failure:^(NSError *error) {
    }];
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
#pragma mark - TableView delegate and datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    ConsultMessage *consult = self.datas[indexPath.row];
    cell.textLabel.text = consult.title;
    cell.detailTextLabel.text = consult.createTime;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ConsultMessage *consult = self.datas[indexPath.row];
    ConsultDetailController *consultVC = [[ConsultDetailController alloc] init];
    consultVC.consultMessage = consult;
    [self.navigationController pushViewController:consultVC animated:YES];
    
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
