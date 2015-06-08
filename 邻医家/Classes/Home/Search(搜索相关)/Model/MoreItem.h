//
//  MoreItem.h
//  邻医家
//
//  Created by myApple on 15/5/5.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
typedef void (^MoreItemOperation)();
#import <Foundation/Foundation.h>

@interface MoreItem : NSObject
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) MoreItemOperation operation;
@property (nonatomic,assign) Class destClass;
+ (instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon destClass:(Class)destClass;
+ (instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon;
+ (instancetype)itemWithTitle:(NSString *)title;
+ (instancetype)item;
@end
