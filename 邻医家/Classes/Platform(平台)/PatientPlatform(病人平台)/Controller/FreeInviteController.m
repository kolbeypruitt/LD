//
//  FreeInviteController.m
//  邻医家
//
//  Created by Daniel on 15/6/7.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "FreeInviteController.h"
#import "UIBarButtonItem+ENTER.h"
@interface FreeInviteController ()

@end

@implementation FreeInviteController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.title = @"自由请医";
    [self setNav];
}
- (void)setNav
{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self
                                                                      action:@selector(addInviteMessage)
                                                                       title:@"添加"];
}
- (void)addInviteMessage
{
    
}
#pragma mark - Table Datasource and Delegate
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
    cell.textLabel.text = @"医友张三邀请杨传喜教授诊断呼吸内科疾病";
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
@end
