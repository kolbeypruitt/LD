//
//  LDEnterProctolView.m
//  邻医家
//
//  Created by Daniel on 15/7/23.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "LDCheckBox.h"
#import "LDEnterProctolView.h"
#import "IWCommon.h"
@interface LDEnterProctolView ()
@property (weak, nonatomic) IBOutlet LDCheckBox *checkBox;
@property (weak, nonatomic) IBOutlet UIButton *protocolButton;

@end
@implementation LDEnterProctolView
- (instancetype)init
{
    if (self = [super init]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"LDEnterProctolView" owner:nil options:nil] lastObject];
    }
    return self;
}
- (void)awakeFromNib
{
    [self.protocolButton setBackgroundColor:[UIColor whiteColor]];
    [self.protocolButton setTitleColor:IWColor(88, 202, 203) forState:UIControlStateNormal];
}
- (IBAction)protocolBtnClicked:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(enterProctrolView:didClickedProctolBtn:)]) {
        [self.delegate enterProctrolView:self didClickedProctolBtn:sender];
    }
}
- (BOOL)isChecked
{
    return self.checkBox.selected;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}
@end
