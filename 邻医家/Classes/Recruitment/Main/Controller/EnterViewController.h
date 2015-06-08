//
//  EnterViewController.h
//  邻医家
//
//  Created by Daniel on 15/5/18.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EnterViewController : UIViewController
/**
 *  入驻医院数组
 */
@property (nonatomic,strong) NSMutableArray *hospitals;
/**
 *   入驻医生数组
 */
@property (nonatomic,strong) NSMutableArray *doctors;
/**
 *  入驻病友数组
 */
@property (nonatomic,strong) NSMutableArray *patients;

@end
