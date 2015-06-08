//
//  CoreExpertResult.m
//  邻医家
//
//  Created by Daniel on 15/5/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "CoreExpertResult.h"
#import "MJExtension.h"
#import "Doctor.h"
@implementation CoreExpertResult
- (NSDictionary *)objectClassInArray
{
    return @{@"doctors" : [Doctor class]};
}
@end
