//
//  PostDocListResult.h
//  邻医家
//
//  Created by Daniel on 15/5/15.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PostDocListResult : NSObject
@property (nonatomic,copy) NSString *status;
@property (nonatomic,strong) NSArray *postdoctorStations;
@end
