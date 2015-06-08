//
//  DepartmentDelegate.h
//  邻医家
//
//  Created by Daniel on 15/5/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "ActionSheetCustomPickerDelegate.h"
#import <Foundation/Foundation.h>

@interface DepartmentDelegate : NSObject <ActionSheetCustomPickerDelegate>

@property (nonatomic,strong) NSArray *departments;
@end
