//
//  ConsultMessage.h
//  邻医家
//
//  Created by Daniel on 15/6/10.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConsultMessage : NSObject
@property (nonatomic,assign) int id;
@property (nonatomic,copy) NSString *createTime;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *type;
@end
