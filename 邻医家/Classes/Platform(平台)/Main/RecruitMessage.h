//
//  RecruitMessage.h
//  邻医家
//
//  Created by Daniel on 15/6/4.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecruitMessage : NSObject
/**
 *  标题
 */
@property (nonatomic,copy) NSString *title;
/**
 *   详情
 */
@property (nonatomic,copy) NSString *detailMessage;
+ (instancetype)messageWithTitle:(NSString *)title detailMessage:(NSString *)detail;
@end
