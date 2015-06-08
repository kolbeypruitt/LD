//
//  MoreGroup.h
//  邻医家
//
//  Created by myApple on 15/5/5.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> 

@interface MoreGroup : NSObject
@property (nonatomic,copy) NSString *header;
@property (nonatomic,copy) NSString *footer;
@property (nonatomic,strong) NSArray *items;
@property (nonatomic,assign) CGSize cellSize;
+ (instancetype)group;
@end
