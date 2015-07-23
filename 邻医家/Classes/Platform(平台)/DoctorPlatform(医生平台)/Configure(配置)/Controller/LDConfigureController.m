//
//  LDConfigureController.m
//  邻医家
//
//  Created by Daniel on 15/7/23.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDCheckBox.h"
#import "LDConfigureController.h"
#import "LDConfigureCell.h"
@interface LDConfigureController ()
@property (nonatomic,strong) NSArray *configureTitles;
@end

@implementation LDConfigureController
- (NSArray *)configureTitles
{
    if (_configureTitles == nil) {
        _configureTitles = @[@"医友请医信息",@"外出会诊(开刀)信息",@"自由转诊信息",@"兼职(多点执业)招聘",@"住院/专科医生规培或实习",@"进修",@"博士后进站招聘",@"全职招聘"];
    }
    return _configureTitles;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.configureTitles.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LDConfigureCell *cell = [LDConfigureCell cellWithTableView:tableView];
    cell.configureLabel.text = self.configureTitles[indexPath.row];
    return  cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    LDConfigureCell *cell = (LDConfigureCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.checkBox.selected = !cell.checkBox.selected;
}
@end
