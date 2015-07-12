//
//  LDMessage.h
//  邻医家
//
//  Created by Daniel on 15/7/12.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LDMessage : NSObject
@property (nonatomic,copy) NSString *firstTitle;
@property (nonatomic,copy) NSString *secondTitle;
+ (instancetype)messageWithFirstTitle:(NSString *)firstTitle secondTitle:(NSString *)secondTitle;
@end
