//
//  LDEnterProctolView.h
//  邻医家
//
//  Created by Daniel on 15/7/23.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import <UIKit/UIKit.h>
@class LDEnterProctolView;
@protocol LDEnterProctolViewDelegate <NSObject>

@optional
- (void)enterProctrolView:(LDEnterProctolView *)proctolView
     didClickedProctolBtn:(UIButton *)button;

@end

@interface LDEnterProctolView : UIView
@property (nonatomic,weak) id<LDEnterProctolViewDelegate> delegate;
@property (nonatomic,assign,getter=isChecked) BOOL checked;
@end
