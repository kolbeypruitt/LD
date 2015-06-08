//
//  LDBaseParam.m
//  邻医家
//
//  Created by Daniel on 15/5/29.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "LDBaseParam.h"
#import "AccountTool.h"
@implementation LDBaseParam
- (NSString *)token
{
    if (_token == nil) {
        _token = [[AccountTool account] token];
    }
    return _token;
}
@end
