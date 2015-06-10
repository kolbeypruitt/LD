//
//  ActionSheetDatePicker+LD.h
//  邻医家
//
//  Created by Daniel on 15/6/10.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "ActionSheetDatePicker.h"

@interface ActionSheetDatePicker (LD)
+ (instancetype)dataPickerWithTitle:(NSString *)title
                     datePickerMode:(UIDatePickerMode)datePickerMode
                         doneBlocke:(ActionDateDoneBlock)doneBlock
                        cancelBlock:(ActionDateCancelBlock)cancelBlock
                             origin:(UIView *)origin;
@end
