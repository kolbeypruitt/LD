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
#import "FirstDepartmentDelegate.h"
#import "AssignDepartmentController.h"
#import "MBProgressHUD+MJ.h"
#import "HospitalEnterTextField.h"
#import "LDEnterData.h"
#import "Common.h"
#import "LDNotification.h"
#import "SetCharageParam.h"
@interface AssignDepartmentController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *commitBtn;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *telnumTextField;
@property (weak, nonatomic) IBOutlet HospitalEnterTextField *chooseTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextfield;
@property (weak, nonatomic) IBOutlet UITextField *introductionTextfield;
@property (weak, nonatomic) IBOutlet UITextField *mailTextfield;

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
    if ([self isCompleteMessage]) {
        
        SetCharageParam *param = [self fillParam];
        
        [SetChargeTool setChargeWithParam:param success:^(BaseResult *result) {
            if ([result.status isEqualToString:@"S"]) {
                [DefaultCenter postNotificationName:MANAGERLISTREFRESHNOTIFICATION object:self];
                [self.navigationController popViewControllerAnimated:YES];
            }else
            {
                [MBProgressHUD showError:@"发布失败!"];
            }
        } failure:^(NSError *error) {
            
        }];
    }
    
    
}
- (SetCharageParam *)fillParam
{
    SetCharageParam *param = [[SetCharageParam alloc] init];
    param.name = self.nameTextField.text;
    param.telnum = self.telnumTextField.text;
    param.phone = self.phoneTextfield.text;
    param.mailbox = self.mailTextfield.text;
    param.id = self.chooseTextField.enterData.department;
    param.introduction = self.introductionTextfield.text;
    return param;
}
- (BOOL)isCompleteMessage
{
    if (self.nameTextField.text.length == 0) {
        [MBProgressHUD showError:self.nameTextField.placeholder];
        return NO;
    }
    if (self.telnumTextField.text.length == 0) {
        [MBProgressHUD showError:self.telnumTextField.placeholder];
        return NO;
    }
    if (self.phoneTextfield.text.length == 0) {
        [MBProgressHUD showError:self.phoneTextfield.placeholder];
        return NO;
    }
    if (self.mailTextfield.text.length == 0) {
        [MBProgressHUD showError:self.mailTextfield.placeholder];
        return NO;
    }
    if (self.chooseTextField.text.length == 0) {
        [MBProgressHUD showError:self.chooseTextField.placeholder];
        return NO;
    }
    if (self.introductionTextfield.text.length == 0) {
        [MBProgressHUD showError:self.introductionTextfield.placeholder];
        return NO;
    }
    return YES;
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
                                                                                              delegate:[[FirstDepartmentDelegate alloc] init]
                                                                                                origin:textField];
                [customPicker showActionSheetPicker];
        return NO;
    }
    return YES;
}
@end










