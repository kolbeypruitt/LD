//
//  FirstDepartmentDelegate.h
//  邻医家
//
//  Created by Daniel on 15/7/7.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "ActionSheetCustomPickerDelegate.h"
#import <Foundation/Foundation.h>

@interface FirstDepartmentDelegate : NSObject <ActionSheetCustomPickerDelegate>
@property (nonatomic,strong) NSArray *departments;
@end
