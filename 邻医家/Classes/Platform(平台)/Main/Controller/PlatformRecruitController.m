//
//  PlatformRecruitController.m
//  邻医家
//
//  Created by Daniel on 15/6/1.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "PlatformRecruitController.h"
#import "RecruitDetailController.h"
@interface PlatformRecruitController ()

@end

@implementation PlatformRecruitController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.title = @"招聘";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseid"];
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"reuseid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.textLabel.text = @"力邀普外科学科带头人享受正编＋安家费50万";
    cell.detailTextLabel.text = @"2015-06-04";
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RecruitDetailController *detatilVC = [[RecruitDetailController alloc] init];
    [self.navigationController pushViewController:detatilVC animated:NO];
}
@end
