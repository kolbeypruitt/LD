//
//  ActionSheetDatePicker+LD.m
//  邻医家
//
//  Created by Daniel on 15/6/10.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "ActionSheetDatePicker+LD.h"

@implementation ActionSheetDatePicker (LD)
+ (instancetype)dataPickerWithTitle:(NSString *)title datePickerMode:(UIDatePickerMode)datePickerMode doneBlocke:(ActionDateDoneBlock)doneBlock cancelBlock:(ActionDateCancelBlock)cancelBlock origin:(UIView *)origin
{
    ActionSheetDatePicker *picker = [[ActionSheetDatePicker alloc] initWithTitle:title datePickerMode:datePickerMode selectedDate:[NSDate date] doneBlock:doneBlock cancelBlock:cancelBlock origin:origin];
    UIBarButtonItem *doneBarItem = [[UIBarButtonItem alloc] initWithTitle:@"确定"
                                                                        style:UIBarButtonItemStyleDone
                                                                       target:nil
                                                                       action:nil];
    UIBarButtonItem *cancelBarItem = [[UIBarButtonItem alloc] initWithTitle:@"取消"
                                                                                   style:UIBarButtonItemStylePlain
                                                                                  target:nil
                                                                                  action:nil];
   [picker setCancelButton:cancelBarItem];
   [picker setDoneButton:doneBarItem];
    return picker;
}
@end
