//
//  LDSearchSubjectController.m
//  邻医家
//
//  Created by Daniel on 15/7/26.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "LDSearchSubjectController.h"
#import "LDNotification.h"
@interface LDSearchSubjectController ()

@end

@implementation LDSearchSubjectController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"根据学科搜索";
    [self setNotification];
}
- (void)setNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(processNotification:) name:SUBJECTCHOSSEDNOTIFICATION object:nil];
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
