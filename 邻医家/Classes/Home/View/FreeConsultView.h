//
//  freeConsultView.h
//  邻医家
//
//  Created by Daniel on 15/4/29.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class FreeConsultView;

@protocol FreeConsultDelegate <NSObject>
@optional
- (void)didClickedFreeConsultView:(FreeConsultView *)consultView;
@end

#import <UIKit/UIKit.h>

@interface FreeConsultView : UIImageView
@property (nonatomic,weak) id<FreeConsultDelegate> delegate;
@end
