//
//  SecondClass.h
//  邻医家
//
//  Created by Daniel on 15/5/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SecondClass : NSObject
{
    int _id;
}
@property (nonatomic,assign) int Id;
@property (nonatomic,strong) NSArray *illness;
@property (nonatomic,copy) NSString *name;
@end

