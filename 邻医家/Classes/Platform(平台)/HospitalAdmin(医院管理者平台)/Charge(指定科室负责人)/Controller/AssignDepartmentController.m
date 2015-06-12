//
//  AssignDepartmentController.m
//  邻医家
//
//  Created by Daniel on 15/6/12.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "BaseResult.h"
#import "ActionSheetCustomPicker+LD.h"
#import "SetChargeTool.h"
#import "SingleDepartmentDelegate.h"
#import "AssignDepartmentController.h"
#import "MBProgressHUD+MJ.h"
#import "HospitalEnterTextField.h"
#import "LDEnterData.h"
#import "Common.h"
#import "SetCharageParam.h"
@interface AssignDepartmentController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *commitBtn;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *telnumTextField;
@property (weak, nonatomic) IBOutlet HospitalEnterTextField *chooseTextField;

@end

@implementation AssignDepartmentController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.title = @"指定科室负责人";
    self.view.backgroundColor = IWColor(226, 226, 226);
    self.navigationItem.rightBarButtonItem = nil;
    [self setupButton];
    [self setupTextField];
}
- (void)setupTextField
{
    self.chooseTextField.delegate = self;
}
- (void)setupButton
{
    [self.commitBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)buttonClicked:(UIButton *)button
{
    if (self.nameTextField.text.length == 0) {
        [MBProgressHUD showError:@"请输入姓名"];
        return;
    }
    if (self.telnumTextField.text.length == 0) {
        [MBProgressHUD showError:@"请输入电话号码"];
        return;
    }
    if (self.chooseTextField.text.length == 0) {
        [MBProgressHUD showError:@"请选择科室"];
        return;
    }
    SetCharageParam *param = [[SetCharageParam alloc] init];
    param.id = self.chooseTextField.enterData.department;
    param.name = self.nameTextField.text;
    param.telnum = self.telnumTextField.text;
    
    [SetChargeTool setChargeWithParam:param success:^(BaseResult *result) {
        if ([result.status isEqualToString:@"S"]) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    } failure:^(NSError *error) {
        
    }];
    
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

#pragma mark - UITextField Delegate Method
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if ([textField isEqual:self.chooseTextField]) {
        ActionSheetCustomPicker *customPicker = [ActionSheetCustomPicker customPickerWithTitle:@"选择科室"
                                                                                              delegate:[[SingleDepartmentDelegate alloc] init]
                                                                                                origin:textField];
                [customPicker showActionSheetPicker];
        return NO;
    }
    return YES;
}
@end











