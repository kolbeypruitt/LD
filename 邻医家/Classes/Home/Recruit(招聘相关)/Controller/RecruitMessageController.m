//
//  RecruitMessageController.m
//  邻医家
//
//  Created by Daniel on 15/5/11.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#define BUTTONRADIUS 8
#import "RecruitMessageController.h"
#import "PostDocRecruitController.h"

@interface RecruitMessageController ()
@property (weak, nonatomic) IBOutlet UIButton *multiJobBtn;
@property (weak, nonatomic) IBOutlet UIButton *inviteExpertBtn;
@property (weak, nonatomic) IBOutlet UIButton *studyBtn;
@property (weak, nonatomic) IBOutlet UIButton *postDocBtn;
@property (weak, nonatomic) IBOutlet UIButton *practiceBtn;
- (IBAction)mutiJobBtnClicked:(UIButton *)sender;
- (IBAction)inviteExpertBtnClicked:(UIButton *)sender;
- (IBAction)studyBtnClicked:(UIButton *)sender;
- (IBAction)postDocBtnClicked:(UIButton *)sender;
- (IBAction)practiceBtnClicked:(UIButton *)sender;

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
    self.inviteExpertBtn.layer.cornerRadius = BUTTONRADIUS;
    self.studyBtn.layer.cornerRadius = BUTTONRADIUS;
    self.postDocBtn.layer.cornerRadius = BUTTONRADIUS;
    self.practiceBtn.layer.cornerRadius = BUTTONRADIUS;
}
- (void)setup
{
    self.title = @"专家邀请";
}


- (IBAction)mutiJobBtnClicked:(UIButton *)sender {
    PostDocRecruitController *postVC = [[PostDocRecruitController alloc] init];
    postVC.title = sender.currentTitle;
    [self.navigationController pushViewController:postVC animated:YES];
}

- (IBAction)inviteExpertBtnClicked:(UIButton *)sender {
    PostDocRecruitController *postVC = [[PostDocRecruitController alloc] init];
    postVC.title = sender.currentTitle;
    [self.navigationController pushViewController:postVC animated:YES];
}

- (IBAction)studyBtnClicked:(UIButton *)sender {
    PostDocRecruitController *postVC = [[PostDocRecruitController alloc] init];
    postVC.title = sender.currentTitle;
    [self.navigationController pushViewController:postVC animated:YES];
}

- (IBAction)postDocBtnClicked:(UIButton *)sender {
    PostDocRecruitController *postVC = [[PostDocRecruitController alloc] init];
    postVC.title = sender.currentTitle;
    [self.navigationController pushViewController:postVC animated:YES];
}

- (IBAction)practiceBtnClicked:(UIButton *)sender {
    PostDocRecruitController *postVC = [[PostDocRecruitController alloc] init];
    postVC.title = sender.currentTitle;
    [self.navigationController pushViewController:postVC animated:YES];
}
@end






