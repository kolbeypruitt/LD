//
//  SearchDoctorResult.h
//  邻医家
//
//  Created by Daniel on 15/6/6.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchDoctorResult : NSObject
@property (nonatomic,weak) NSString *status;
@property (nonatomic,strong) NSArray *doctors;
@end
