//
//  ChangParam.h
//  邻医家
//
//  Created by Daniel on 15/7/21.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChangParam : NSObject
@property (nonatomic,copy) NSString *telnum;
@property (nonatomic,copy) NSString *code;
@property (nonatomic,copy) NSString *password;
+ (instancetype)paraWithTelnum:(NSString *)telnum
                          code:(NSString *)code
                      password:(NSString *)password;
@end
