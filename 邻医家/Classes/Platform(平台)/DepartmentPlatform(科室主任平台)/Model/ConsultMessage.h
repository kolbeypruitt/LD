//
//  ConsultMessage.h
//  邻医家
//
//  Created by Daniel on 15/6/10.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConsultMessage : NSObject
@property (nonatomic,assign) int id;
@property (nonatomic,copy) NSString *createTime;
@property (nonatomic,copy) NSString *title;
/**
 *  1，开刀 2，疑难杂症会诊 3，临时坐诊 4，转诊
 */
@property (nonatomic,assign) int type;
@end
