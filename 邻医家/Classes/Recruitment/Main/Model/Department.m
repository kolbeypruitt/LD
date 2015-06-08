//
//  Department.m
//  邻医家
//
//  Created by Daniel on 15/5/25.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "Department.h"
#import "SecondClass.h"
#import "MJExtension.h"
@implementation Department
@synthesize Id = _id;
- (NSDictionary *)objectClassInArray
{
    return @{@"secondClass" : [SecondClass class]};
}
@end
