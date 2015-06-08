//
//  ActionSheetCustomPicker+LD.m
//  邻医家
//
//  Created by Daniel on 15/5/28.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "ActionSheetCustomPicker+LD.h"

@implementation ActionSheetCustomPicker (LD)
+ (instancetype)customPickerWithTitle:(NSString *)title delegate:(id<ActionSheetCustomPickerDelegate>)delegate origin:(id)origin
{
    ActionSheetCustomPicker *customPicker = [[ActionSheetCustomPicker alloc] initWithTitle:title
                                                                                  delegate:delegate
                                                                          showCancelButton:YES
                                                                                    origin:origin];
    UIBarButtonItem *doneBarItem = [[UIBarButtonItem alloc] initWithTitle:@"确定"
                                                                        style:UIBarButtonItemStyleDone
                                                                       target:nil
                                                                       action:nil];
    UIBarButtonItem *cancelBarItem = [[UIBarButtonItem alloc] initWithTitle:@"取消"
                                                                                   style:UIBarButtonItemStylePlain
                                                                                  target:nil
                                                                                  action:nil];
                [customPicker setCancelButton:cancelBarItem];
                [customPicker setDoneButton:doneBarItem];
    return customPicker;
}
@end
