//
//  MoreCell.h
//  邻医家
//
//  Created by myApple on 15/5/5.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
@class MoreItem,MoreCell,UIButton;
@protocol MoreCellDelegate <NSObject>

@optional
- (void)moreCell:(MoreCell *)cell didClickedBtn:(UIButton *)button;
@end
#import <UIKit/UIKit.h>

@interface MoreCell : UICollectionViewCell
@property (nonatomic,strong) MoreItem *item;
@property (nonatomic,weak) id<MoreCellDelegate> delegate;
@end
