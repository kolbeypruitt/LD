//
//  FreeInviteHeaderView.h
//  邻医家
//
//  Created by Daniel on 15/7/13.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PatienInviteDetail;
@interface FreeInviteHeaderView : UIImageView
@property (nonatomic,strong) PatienInviteDetail *detailMsg;
@property (weak, nonatomic) IBOutlet UIButton *acceptedBtn;
@property (weak, nonatomic) IBOutlet UIButton *allBtn;
@end
