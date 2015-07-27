//
//  InviteDocMessage.h
//  邻医家
//
//  Created by Daniel on 15/6/14.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InviteDocMessage : NSObject
@property (nonatomic,copy) NSString *doctorName;
@property (nonatomic,assign) int id;
@property (nonatomic,assign) int succeed;
@property (nonatomic,copy) NSString *techtitle;
@property (nonatomic,copy) NSString *time;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,assign) int type;
@end
