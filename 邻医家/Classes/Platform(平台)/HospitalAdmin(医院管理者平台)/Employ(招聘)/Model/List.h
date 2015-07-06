//
//  List.h
//  邻医家
//
//  Created by Daniel on 15/7/6.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface List : NSObject
@property (nonatomic,strong) NSArray *list;
/**
 *  1,全职 2，兼职 3，实习 4，进修 5，博士
 */
@property (nonatomic,assign) int type;
@end
