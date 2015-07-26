//
//  RecruitMessageController.m
//  邻医家
//
//  Created by Daniel on 15/5/11.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#define BUTTONRADIUS 8
#import "IWCommon.h"
#import "LDPlatformButton.h"
#import "RecruitMessageController.h"
#import "MultiInviteController.h"
@interface RecruitMessageController ()
@property (weak, nonatomic) IBOutlet LDPlatformButton *multiJobBtn;
@property (weak, nonatomic) IBOutlet LDPlatformButton *inviteExpertBtn;
@property (weak, nonatomic) IBOutlet LDPlatformButton *studyBtn;
@property (weak, nonatomic) IBOutlet LDPlatformButton *postDocBtn;
@property (weak, nonatomic) IBOutlet LDPlatformButton *practiceBtn;


@end

@implementation RecruitMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self setupBtn];
}
- (void)setupBtn
{
    self.multiJobBtn.layer.cornerRadius = BUTTONRADIUS;
    [self setBtn:self.multiJobBtn bgColor:IWColor(135, 191, 221) image:@"nav4"];
    self.inviteExpertBtn.layer.cornerRadius = BUTTONRADIUS;
    [self setBtn:self.inviteExpertBtn bgColor:IWColor(88, 202, 203) image:@"nav5"];
    
    self.studyBtn.layer.cornerRadius = BUTTONRADIUS;
    [self setBtn:self.studyBtn bgColor:IWColor(64, 197, 88) image:@"nav6"];
    
    self.postDocBtn.layer.cornerRadius = BUTTONRADIUS;
    [self setBtn:self.postDocBtn bgColor:IWColor(244, 96, 115) image:@"nav7"];
    
    self.practiceBtn.layer.cornerRadius = BUTTONRADIUS;
    [self setBtn:self.practiceBtn bgColor:IWColor(249, 161, 54) image:@"nav8"];
}
- (void)setBtn:(LDPlatformButton *)button bgColor:(UIColor *)color image:(NSString *)image
{
    [button setBackgroundColor:color];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
}
- (void)setup
{
    self.title = @"专家邀请";
}


- (IBAction)buttonClicked:(LDPlatformButton *)sender {
    MultiInviteController *inviteVC = [[MultiInviteController alloc] init];
    inviteVC.title = sender.currentTitle;
    
    if ([sender isEqual:self.multiJobBtn]) {
        inviteVC.type = 2;
    }else if([sender isEqual:self.inviteExpertBtn])
    {
        inviteVC.type = 1;
    }else if([self isEqual:self.practiceBtn])
    {
        inviteVC.type = 3;
    }else if([self isEqual:self.studyBtn])
    {
        inviteVC.type = 4;
    }else
    {
        inviteVC.type = 5;
    }
    [self.navigationController pushViewController:inviteVC animated:YES];
}



@end






