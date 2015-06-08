//
//  LDFormData.h
//  邻医家
//
//  Created by Daniel on 15/6/1.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * 用来封装文件的数据模型
 */
@interface LDFormData : NSObject
/**
 *  文件数据
 */
@property (nonatomic,strong) NSData *data;
/**
 *  参数名（与服务器要求的参数名一致）
 */
@property (nonatomic,copy) NSString *name;
/**
 *  文件名
 */
@property (nonatomic,copy) NSString *filename;
/**
 *  文件类型
 */
@property (nonatomic,copy) NSString *mimiType;
+ (instancetype)formDataWithData:(NSData *)data
                            name:(NSString *)name
                        filename:(NSString *)filename
                        mimiType:(NSString *)mimiType;
@end