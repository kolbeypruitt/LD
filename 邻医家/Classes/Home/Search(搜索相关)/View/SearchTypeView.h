//
//  SearchTypeView.h
//  邻医家
//
//  Created by Daniel on 15/6/23.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class HotAreaView,HotDepmentView,TopExpertView;
#import <UIKit/UIKit.h>

@interface SearchTypeView : UIImageView
@property (nonatomic,strong) NSArray *locations;
/**
 *   热门地区
 */
@property (nonatomic,weak) HotAreaView *hotAreaView;
/**
 *  热门科室
 */
@property (nonatomic,weak) HotDepmentView *hotDepView;
/**
 *  重要专家
 */
@property (nonatomic,weak) TopExpertView *topExpertView;
@end
