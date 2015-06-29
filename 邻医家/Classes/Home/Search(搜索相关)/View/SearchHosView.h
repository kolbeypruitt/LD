//
//  SearchHosView.h
//  邻医家
//
//  Created by Daniel on 15/6/29.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class HotAreaView,HotHospitalView,HotDepmentView;
#import <UIKit/UIKit.h>

@interface SearchHosView : UIImageView
/**
 *   热门地区
 */
@property (nonatomic,weak) HotAreaView *hotAreaView;
/**
 *  热门医院
 */
@property (nonatomic,weak) HotHospitalView *hotHosView;
/**
 *  热门科室
 */
@property (nonatomic,weak) HotDepmentView *hotdepView;
@end
