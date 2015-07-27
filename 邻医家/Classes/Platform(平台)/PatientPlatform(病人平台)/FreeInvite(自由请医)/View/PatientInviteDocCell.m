//
//  PatientInviteDocCell.m
//  邻医家
//
//  Created by Daniel on 15/7/27.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "InviteDocMessage.h"
#import "PatientInviteDocCell.h"
#import "Common.h"
@interface PatientInviteDocCell ()
@property (weak, nonatomic) IBOutlet UILabel *inviteName;
@property (weak, nonatomic) IBOutlet UILabel *inviteTime;
@property (weak, nonatomic) IBOutlet UILabel *repondedDoctor;

@end
@implementation PatientInviteDocCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"patientinvitedoccell";
    PatientInviteDocCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"PatientInviteDocCell" owner:nil options:nil] lastObject];
    }
    return cell;
}
- (void)setMessage:(InviteDocMessage *)message
{
    _message = message;
    self.inviteName.text = message.title;
    self.inviteTime.text = message.time;
    NSString *doctorTitle = nil;
    if (message.succeed == 1) {//有医生响应
        self.repondedDoctor.hidden = NO;
        doctorTitle = [NSString stringWithFormat:@"已录取%@(%@)",message.doctorName,message.techtitle];
        self.repondedDoctor.text = doctorTitle;
    }else{
        self.repondedDoctor.hidden = YES;
    }
}
@end
