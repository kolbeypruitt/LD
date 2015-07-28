//
//  PatientPlatformController.m
//  邻医家
//
//  Created by Daniel on 15/6/7.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "GroupViewController.h"
#import "RewardInviteController.h"
#import "PatientPlatformController.h"
#import "FreeInviteController.h"
#import "LDPlatformButton.h"
#import "Common.h"
@interface PatientPlatformController ()
@property (nonatomic,weak) LDPlatformButton *inviteBtn;
@property (nonatomic,weak) LDPlatformButton *cureBtn;
@property (nonatomic,weak) LDPlatformButton *groupBtn;
@end

@implementation PatientPlatformController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    self.navigationItem.title = @"医友平台";
    self.view.backgroundColor = IWColor(226, 226, 226);
    [self addCustomviews];
    [self layoutCustomViews];
}
- (void)addCustomviews
{
    self.inviteBtn = [self createBtnWithTitle:@"自由请医服务" target:self action:@selector(buttonPressed:)];
    [self.inviteBtn setImage:[UIImage imageNamed:@"freeinvite"] forState:UIControlStateNormal];
    [self.inviteBtn setBackgroundColor:IWColor(88, 202, 203)];
    
    self.cureBtn = [self createBtnWithTitle:@"悬赏就医服务" target:self action:@selector(buttonPressed:)];
    [self.cureBtn setImage:[UIImage imageNamed:@"rewardinvite"] forState:UIControlStateNormal];
    [self.cureBtn setBackgroundColor:IWColor( 64,  197, 88 )];
    
    self.groupBtn = [self createBtnWithTitle:@"团请医生服务" target:self action:@selector(buttonPressed:)];
    [self.groupBtn setImage:[UIImage imageNamed:@"groupinvite"] forState:UIControlStateNormal];
    [self.groupBtn setBackgroundColor:IWColor( 245,  96, 115)];
}
- (void)buttonPressed:(LDPlatformButton *)senderBtn
{
    if ([senderBtn isEqual:self.inviteBtn]) {
        FreeInviteController *freeInvite = [[FreeInviteController alloc] init];
        [self.navigationController pushViewController:freeInvite animated:YES];
    }else if([senderBtn isEqual:self.groupBtn])
    {
        GroupViewController *groupVC = [[GroupViewController alloc] init];
        self.view.window.backgroundColor = BGCOLOR;
        [self.navigationController pushViewController:groupVC animated:YES];
    }
    else{
        RewardInviteController *reward = [[RewardInviteController alloc] init];
        [self.navigationController pushViewController:reward animated:YES];
    }
}
- (void)layoutCustomViews
{
    CGFloat btnX = 10;
    CGFloat btnY = 84;
    CGFloat btnW = (SCREENWIDTH - 30) / 2 ;
    CGFloat btnH = 100;
    self.inviteBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    
    self.cureBtn.frame = CGRectMake(btnW+20, btnY, btnW, btnH);
    
    self.groupBtn.frame = CGRectMake(btnX, CGRectGetMaxY(self.inviteBtn.frame) + btnX, SCREENWIDTH - 2 * btnX, btnH);
}
- (LDPlatformButton *)createBtnWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    LDPlatformButton *button = [LDPlatformButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.layer.cornerRadius = 8;
    [self.view  addSubview:button];
    return button;
}
@end
