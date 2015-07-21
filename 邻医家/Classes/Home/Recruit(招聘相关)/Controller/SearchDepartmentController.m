//
//  SearchDepartmentController.m
//  邻医家
//
//  Created by Daniel on 15/7/20.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "LDNotification.h"
#import "SearchDepartmentController.h"

@interface SearchDepartmentController ()

@end

@implementation SearchDepartmentController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNotification];
}
- (void)setNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(processNotification:) name:DEPARTMENTCHOOSEDNOTIFICATION object:nil];
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)processNotification:(NSNotification *)notificaion
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
