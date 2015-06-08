//
//  HospitalEnterTextField.m
//  邻医家
//
//  Created by Daniel on 15/6/3.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "HospitalEnterTextField.h"
#import "LDEnterData.h"
@implementation HospitalEnterTextField
- (LDEnterData *)enterData
{
    if (_enterData == nil) {
        _enterData = [[LDEnterData alloc] init];
    }
    return _enterData;
}
@end
