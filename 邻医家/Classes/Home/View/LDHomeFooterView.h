//
//  LDHomeFooterView.h
//  邻医家
//
//  Created by Daniel on 15/5/4.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class HomeGroup;
#import <UIKit/UIKit.h>
@class LDHomeFooterView;
@protocol LDHomeFooterViewDelegate <NSObject>
@optional
- (void)footerView:(LDHomeFooterView *)footerView clickedBtn:(UIButton *)button;
@end

@interface LDHomeFooterView : UIImageView
@property (nonatomic,weak) id<LDHomeFooterViewDelegate> delegate;
@property (nonatomic,strong) HomeGroup *group;
- (void)setFooterTitle:(NSString *)title;
@end
