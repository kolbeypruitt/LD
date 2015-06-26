//
//  Department.h
//  邻医家
//
//  Created by Daniel on 15/5/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Department : NSObject
@property (nonatomic,assign) int id;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,strong) NSArray *secondClass;
@end
