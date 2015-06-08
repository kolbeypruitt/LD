//
//  RecruitHeader.h
//  邻医家
//
//  Created by Daniel on 15/4/30.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class RecruitHeader;
#import <UIKit/UIKit.h>
@protocol RecruitHeaderDelegte <NSObject>

@optional
- (void)header:(RecruitHeader *)header didSelectedSegment:(UISegmentedControl *)seg;
@end

@interface RecruitHeader : UIImageView
@property (nonatomic,weak) id<RecruitHeaderDelegte> delegate;
@end
