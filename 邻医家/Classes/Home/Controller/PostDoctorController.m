//
//  PostDoctorController.m
//  邻医家
//
//  Created by Daniel on 15/5/11.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "PostDoctorController.h"

@interface PostDoctorController ()

@end

@implementation PostDoctorController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(remove)];
    
}

- (void)remove
{
    [self.tableView setEditing:!self.tableView.isEditing animated:YES];
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    cell.textLabel.text =[NSString stringWithFormat:@"北京协和医院招聘博士后信息－－－%d",(int)indexPath.row];
    return cell;
}


@end
