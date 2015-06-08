//
//  SearchResultController.h
//  邻医家
//
//  Created by Daniel on 15/5/8.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class DocSearchParam;
#import <UIKit/UIKit.h>

@interface SearchHosResultController : UITableViewController
@property (nonatomic,strong) DocSearchParam *param;
@end
