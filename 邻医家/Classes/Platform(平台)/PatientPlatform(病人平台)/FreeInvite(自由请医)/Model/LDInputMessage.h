//
//  LDInputMessage.h
//  邻医家
//
//  Created by Daniel on 15/7/14.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LDInputMessage : NSObject
@property (nonatomic,copy) NSString *firstTitle;
@property (nonatomic,copy) NSString *placeHolder;
@property (nonatomic,strong) id optionDelegate;
+ (instancetype)messageWithFirstTitle:(NSString *)firsteTitle
                          placeHolder:(NSString *)placeholder
                       optionDelegate:(id)delegate;
@end
