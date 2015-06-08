//
//  ActionSheetCustomPicker+LD.h
//  邻医家
//
//  Created by Daniel on 15/5/28.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "ActionSheetCustomPicker.h"

@interface ActionSheetCustomPicker (LD)
+ (instancetype)customPickerWithTitle:(NSString *)title delegate:(id<ActionSheetCustomPickerDelegate>)delegate origin:(id)origin;
@end
