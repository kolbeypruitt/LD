//
//  PostDocStation.h
//  邻医家
//
//  Created by Daniel on 15/5/20.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PostDocStation : NSObject
{
    int _id;
    NSString *_name;
}
@property (nonatomic,assign) int ID;
@property (nonatomic,copy) NSString *name;
@end
