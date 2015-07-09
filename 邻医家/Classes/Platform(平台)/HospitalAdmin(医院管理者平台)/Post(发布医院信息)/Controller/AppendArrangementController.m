//
//  AppendArrangementController.m
//  邻医家
//
//  Created by Daniel on 15/7/9.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "AppendArrangementController.h"
#import "ReleaseArrangeTool.h"
#import "Common.h"
#import "ReleaseArrangeParam.h"
#import "HospitalEnterTextField.h"
#import "CareerDelegate.h"
#import "DepartmentDelegate.h"
#import "LDEnterData.h"
#import "ActionSheetDatePicker+LD.h"
#import "ActionSheetCustomPicker+LD.h"
#import "UIBarButtonItem+ENTER.h"
#import "LDNotification.h"
#import "MBProgressHUD+MJ.h"
#import "BaseResult.h"
@interface AppendArrangementController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet HospitalEnterTextField *arrangeField;
@property (weak, nonatomic) IBOutlet HospitalEnterTextField *departmentField;
@property (weak, nonatomic) IBOutlet UITextField *timeField;

@end

@implementation AppendArrangementController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.title = @"发布专家坐诊信息";
    self.view.backgroundColor = BGCOLOR;
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(commit) title:@"提交"];
}
- (void)commit
{
    if ([self messageIsComplete]) {
        ReleaseArrangeParam *param = [self fillParam];
        [ReleaseArrangeTool releaseArrangeWithParam:param success:^(BaseResult *result) {
            if ([result.status isEqualToString:SUCCESSSTATUS]) {
                [DefaultCenter postNotificationName:RELEASEARRANGESUCCESSNOTIFICATION object:self];
                [self.navigationController popViewControllerAnimated:YES];
            }
        } failure:^(NSError *error) {
            
        }];
    }
}
- (BOOL)messageIsComplete
{
    if (self.nameField.text.length == 0) {
        [MBProgressHUD showError:@"请输入姓名"];
        return NO;
    }
    if (self.timeField.text.length == 0) {
        [MBProgressHUD showError:@"请输入坐诊时间"];
        return NO;
    }
    if (self.departmentField.text.length == 0) {
        [MBProgressHUD showError:@"请输入科室"];
        return NO;
    }
    if (self.arrangeField.text.length == 0) {
        [MBProgressHUD showError:@"请输入临床职称"];
        return NO;
    }
    return YES;
}
- (ReleaseArrangeParam *)fillParam
{
    ReleaseArrangeParam *param = [[ReleaseArrangeParam alloc] init];
    param.name = self.nameField.text;
    param.timePeriod = self.timeField.text;
    param.department = self.departmentField.enterData.department;
    param.techtitle = self.arrangeField.enterData.techtile;
    return param;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    switch (textField.tag) {
        case 1:
        {
            ActionSheetDatePicker *datePicker = [ActionSheetDatePicker dataPickerWithTitle:@"选择时间" datePickerMode:UIDatePickerModeDateAndTime doneBlocke:^(ActionSheetDatePicker *picker, id selectedDate, id origin) {
                NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
                dateFormater.dateFormat = @"yyyy-MM-dd-HH:mm";
                NSString *dateStr = [dateFormater stringFromDate:selectedDate];
                textField.text = dateStr;
            } cancelBlock:^(ActionSheetDatePicker *picker) {
                
            } origin:textField];
            [datePicker showActionSheetPicker];
            return NO;
            break;
        }
        case 2:
        {
            ActionSheetCustomPicker *picker = [ActionSheetCustomPicker customPickerWithTitle:@"选择科室"
                                                                                    delegate:[[DepartmentDelegate alloc] init]
                                                                                      origin:textField];
            [picker showActionSheetPicker];
            return NO;
            break;
        }
        case 3:
        {
            ActionSheetCustomPicker *picker = [ActionSheetCustomPicker customPickerWithTitle:@"选择职称"
                                                                                    delegate:[[CareerDelegate alloc] init]
                                                                                      origin:textField];
            [picker showActionSheetPicker];
            return NO;
            break;
        }
        default:
            return YES;
            break;
    }
}
@end
