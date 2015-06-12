//
//  Employee.h
//  邻医家
//
//  Created by Daniel on 15/6/11.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Employee : NSObject
@property (nonatomic,copy) NSString *createTime;
@property (nonatomic,assign) int id;
@property (nonatomic,copy) NSString *name;
@end
