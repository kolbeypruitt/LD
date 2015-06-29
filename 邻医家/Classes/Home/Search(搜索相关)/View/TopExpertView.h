//
//  TopExpertView.h
//  邻医家
//
//  Created by Daniel on 15/6/23.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class TopExpertView;
#import <UIKit/UIKit.h>

@protocol TopExpertViewDelegate <NSObject>
@optional
- (void)topExpertView:(TopExpertView *)topView clickedBtn:(UIButton *)button;
@end

@interface TopExpertView : UIImageView
@property (nonatomic,strong) NSArray *doctors;
@property (nonatomic,weak) id<TopExpertViewDelegate> delegate;
@end
