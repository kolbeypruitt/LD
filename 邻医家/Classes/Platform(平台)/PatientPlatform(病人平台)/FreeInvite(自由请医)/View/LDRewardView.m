//
//  LDRewardView.m
//  邻医家
//
//  Created by Daniel on 15/7/23.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "IWCommon.h"
#import "LDCheckBox.h"
#import "LDRewardView.h"
@interface LDRewardView ()
@property (weak, nonatomic) IBOutlet LDCheckBox *checkBox;
@property (weak, nonatomic) IBOutlet UILabel *proctocolLabel;
@end
@implementation LDRewardView

- (instancetype)init
{
    if (self = [super init]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"LDRewardView" owner:nil options:nil] lastObject];
    }
    return self;
}
 - (BOOL)conformed
{
    return self.checkBox.selected;
}
- (void)awakeFromNib{
    self.proctocolLabel.textColor = IWColor(88, 202, 203);
}
@end
