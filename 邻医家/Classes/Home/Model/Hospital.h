//
//  Hospital.h
//  邻医家
//
//  Created by Daniel on 15/5/4.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "HomeItem.h"

@interface Hospital : NSObject
@property (nonatomic,copy) NSString *ID;
@property (nonatomic,copy) NSString *detail;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *headurl;
+ (instancetype)hospitalWithName:(NSString *)name detail:(NSString *)detail;
@end
