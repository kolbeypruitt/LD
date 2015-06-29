//
//  SearchDoctorParam.h
//  邻医家
//
//  Created by Daniel on 15/6/6.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchDoctorParam : NSObject
@property (nonatomic,copy) NSString *cities;
@property (nonatomic,copy) NSString *departments;
@property (nonatomic,copy) NSString *keyWord;
@property (nonatomic,strong) NSNumber *doctor;
@property (nonatomic,assign) int lastId;
@property (nonatomic,assign) int num;
@end
