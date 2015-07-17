//
//  ArrangementDetailController.h
//  邻医家
//
//  Created by Daniel on 15/7/9.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class Arrangement;
#import "LDMessageController.h"
@interface ArrangementDetailController : LDMessageController
@property (nonatomic,strong) Arrangement *arrangement;
@end
