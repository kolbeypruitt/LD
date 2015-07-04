//
//  MessageFrame.h
//  邻医家
//
//  Created by SXQ on 15/7/4.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
// 正文的字体
#define MJTextFont [UIFont systemFontOfSize:15]

// 正文的内边距
#define MJTextPadding 20
@class UCSMessage;
@interface MessageFrame : NSObject
/**
 *  头像的frame
 */
@property (nonatomic, assign, readonly) CGRect iconF;
/**
 *  正文的frame
 */
@property (nonatomic, assign, readonly) CGRect textF;
/**
 *  cell的高度
 */
@property (nonatomic, assign, readonly) CGFloat cellHeight;

/**
 *  数据模型
 */
@property (nonatomic,strong) UCSMessage *message;
@end
