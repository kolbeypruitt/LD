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
#import "CommitMessage.h"
#import "TimeDeletage.h"
#import "LDInputMessage.h"
@interface AppendArrangementController ()<UITextFieldDelegate>

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
    [self addMessages];
}
- (void)addMessages
{
    
    LDInputMessage *message0 = [LDInputMessage messageWithFirstTitle:@"专家姓名" placeHolder:@"请输入专家姓名" optionDelegate:nil];
    LDInputMessage *message1 = [LDInputMessage messageWithFirstTitle:@"坐诊时间" placeHolder:@"请选择坐诊时间" optionDelegate:[[TimeDeletage alloc] init]];
    LDInputMessage *message2 = [LDInputMessage messageWithFirstTitle:@"科室" placeHolder:@"请选择科室" optionDelegate:[[DepartmentDelegate alloc] init]];
    LDInputMessage *message3 = [LDInputMessage messageWithFirstTitle:@"临床职称" placeHolder:@"请选择临床职称" optionDelegate:[[CareerDelegate alloc] init]];
    self.inputMessages = @[message0,message1,message2,message3];
}
- (void)commitBtnClicked
{
    if ([self messageComplete]) {
        [ReleaseArrangeTool releaseArrangeWithParam:[self fillParam] success:^(BaseResult *result) {
            if ([result.status isEqualToString:SUCCESSSTATUS]) {
                [DefaultCenter postNotificationName:RELEASEARRANGESUCCESSNOTIFICATION object:self];
                [self.navigationController popViewControllerAnimated:YES];
            }
        } failure:^(NSError *error) {
            
        }];
    }
}

- (ReleaseArrangeParam *)fillParam
{
    ReleaseArrangeParam *param = [[ReleaseArrangeParam alloc] init];
    param.name =  [self.commitMessages[0] stringMsg];
    param.timePeriod =  [self.commitMessages[1] stringMsg];
    param.department = [self.commitMessages[2] intMsg];
    param.techtitle = [self.commitMessages[3] intMsg];
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
