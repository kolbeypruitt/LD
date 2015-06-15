//
//  PatientPlatformController.m
//  邻医家
//
//  Created by Daniel on 15/6/7.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "PatientPlatformController.h"
#import "FreeInviteController.h"
#import "Common.h"
@interface PatientPlatformController ()
@property (nonatomic,weak) UIButton *inviteBtn;
@property (nonatomic,weak) UIButton *cureBtn;
@end

@implementation PatientPlatformController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.title = @"病人平台";
    [self addCustomviews];
    [self layoutCustomViews];
}
- (void)addCustomviews
{
    self.inviteBtn = [self createBtnWithTitle:@"自由请医" target:self action:@selector(buttonPressed:)];
    self.cureBtn = [self createBtnWithTitle:@"悬赏就医" target:self action:@selector(buttonPressed:)];
}
- (void)buttonPressed:(UIButton *)senderBtn
{
    if ([senderBtn isEqual:self.inviteBtn]) {
        FreeInviteController *freeInvite = [[FreeInviteController alloc] init];
        [self.navigationController pushViewController:freeInvite animated:YES];
    }else{
        
    }
}
- (void)layoutCustomViews
{
    CGFloat btnX = 10;
    CGFloat btnY = 84;
    CGFloat btnW = (SCREENWIDTH - 30) / 2 ;
    CGFloat btnH = 50;
    self.inviteBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    self.inviteBtn.backgroundColor = IWColor(56, 56, 56);
    
    self.cureBtn.frame = CGRectMake(btnW+20, btnY, btnW, btnH);
    self.cureBtn.backgroundColor = IWColor(80, 80, 90);
}
- (UIButton *)createBtnWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.layer.cornerRadius = 8;
    [self.view  addSubview:button];
    return button;
}
@end
