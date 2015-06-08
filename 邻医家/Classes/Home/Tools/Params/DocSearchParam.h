//
//  DocSearchParam.h
//  邻医家
//
//  Created by Daniel on 15/5/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DocSearchParam : NSObject
@property (nonatomic,copy) NSString *cities;
@property (nonatomic,copy) NSString *department;
@property (nonatomic,copy) NSString *name;
+ (DocSearchParam *)docSearchParamWithCities:(NSString *)cities department:(NSString * )department docName:(NSString *)docName;
@end
