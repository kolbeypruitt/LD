//
//  SecondClass.m
//  邻医家
//
//  Created by Daniel on 15/5/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "SecondClass.h"
#import "MJExtension.h"
#import "Disease.h"
@implementation SecondClass
@synthesize Id = _id;
- (NSDictionary *)objectClassInArray
{
    return @{@"illness" : [Disease class]};
}
@end
