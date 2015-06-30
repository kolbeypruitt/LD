//
//  HotHospitalView.h
//  邻医家
//
//  Created by Daniel on 15/6/29.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import <UIKit/UIKit.h>
@class HotHospitalView;
@protocol HotHospitalViewDelegate <NSObject>
@optional
- (void)hotHospitalView:(HotHospitalView *)hospitalView clieckedBtn:(UIButton *)button;
@end

@interface HotHospitalView : UIImageView
@property (nonatomic,strong) NSArray *hospitals;
@property (nonatomic,weak) id<HotHospitalViewDelegate> delegate;
@end
