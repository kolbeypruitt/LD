//
//  Province.m
//  ActionSheetPicker
//
//  Created by Daniel on 15/5/7.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "Province.h"
#import "MJExtension.h"
#import "City.h"
@implementation Province
- (NSDictionary *)objectClassInArray
{
    return @{@"cities" : [City class]};
}
@end
