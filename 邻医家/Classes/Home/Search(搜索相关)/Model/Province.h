//
//  Province.h
//  ActionSheetPicker
//
//  Created by Daniel on 15/5/7.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Province : NSObject
@property (nonatomic,assign) int id;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,strong) NSArray *cities;
@end
