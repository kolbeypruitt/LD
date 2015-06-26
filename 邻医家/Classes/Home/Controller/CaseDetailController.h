//
//  CaseDetailController.h
//  邻医家
//
//  Created by Daniel on 15/6/24.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class Case;
#import <UIKit/UIKit.h>
/**
 *   接受一个Case模型norcase
 */
@interface CaseDetailController : UIViewController
@property (nonatomic,strong) Case *norcase;
@end
