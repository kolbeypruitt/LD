//
//  CareerDelegate.h
//  邻医家
//
//  Created by Daniel on 15/5/28.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ActionSheetCustomPicker.h"
@interface CareerDelegate : NSObject <ActionSheetCustomPickerDelegate>

@end


@interface Career  : NSObject
@property (nonatomic,assign) int Id;
@property (nonatomic,copy) NSString *techtitle;
@end