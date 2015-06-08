//
//  HospitalLevel.h
//  邻医家
//
//  Created by Daniel on 15/5/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HospitalLevel : NSObject <NSCoding>
@property (nonatomic,assign) int ID;
@property (nonatomic,copy) NSString *name;
@end
