//
//  OneOfTwoDelegate.h
//  邻医家
//
//  Created by Daniel on 15/6/10.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ActionSheetCustomPickerDelegate.h"
@interface OneOfTwoDelegate : NSObject <ActionSheetCustomPickerDelegate>
@property (nonatomic,strong) NSMutableArray *choices;
@end
@interface Choice : NSObject
/**
 *  1，需要 2，不需要
 */
@property (nonatomic,assign) int type;
@property (nonatomic,copy) NSString *name;
+ (instancetype)choiceWithName:(NSString *)name type:(int)type;
@end