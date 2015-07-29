//
//  SearchDepartmentController.m
//  邻医家
//
//  Created by Daniel on 15/7/20.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "IWCommon.h"
#import "LDNotification.h"
#import "SearchDepartmentController.h"
#import "ActionSheetCustomPicker+LD.h"
#import "DepartmentDelegate.h"

@interface SearchDepartmentController ()
@property (weak, nonatomic) IBOutlet UIButton *moreDepartmentBtn;

@end

@implementation SearchDepartmentController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNotification];
}
- (void)setNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(processNotification:) name:DEPARTMENTCHOOSEDNOTIFICATION object:nil];
    
    [_moreDepartmentBtn setBackgroundColor:IWColor(88, 202, 203)];
    [_moreDepartmentBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

- (IBAction)moreBtnClicked:(UIButton *)button {
    ActionSheetCustomPicker *picker = [ActionSheetCustomPicker customPickerWithTitle:@"选择科室"
                                                                            delegate:[[DepartmentDelegate alloc] init]
                                                                              origin:button];
    [picker showActionSheetPicker];
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
