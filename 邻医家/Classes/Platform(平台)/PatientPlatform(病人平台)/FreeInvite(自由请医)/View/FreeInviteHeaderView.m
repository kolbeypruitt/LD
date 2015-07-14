//
//  FreeInviteHeaderView.m
//  邻医家
//
//  Created by Daniel on 15/7/13.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "FreeInviteHeaderView.h"
#import "PatienInviteDetail.h"
#import "UIImage+MJ.h"
#import "IWCommon.h"
@interface FreeInviteHeaderView ()
@end
@implementation FreeInviteHeaderView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = IWColor(226, 226, 226);
        self = [[[NSBundle mainBundle] loadNibNamed:@"FreeInviteHeaderView" owner:nil options:nil ] lastObject];
        [self.acceptedBtn setTitleColor:IWColor(88, 202, 203) forState:UIControlStateNormal];
        [self.allBtn setTitleColor:self.acceptedBtn.currentTitleColor forState:UIControlStateNormal];
    }
    return self;
}
- (void)setDetailMsg:(PatienInviteDetail *)detailMsg
{
    _detailMsg = detailMsg;
}
- (void)awakeFromNib
{
    [self.acceptedBtn setTitle:[NSString stringWithFormat:@"已录取%d封医生简历",self.detailMsg.accept] forState:UIControlStateNormal];
    [self.allBtn setTitle:[NSString stringWithFormat:@"共收到%d封医生简历",self.detailMsg.all] forState:UIControlStateNormal];
}
@end
