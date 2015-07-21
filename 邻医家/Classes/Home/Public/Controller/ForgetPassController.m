//
//  ForgetPassController.m
//  邻医家
//
//  Created by Daniel on 15/5/22.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "SignUpTool.h"
#import "MBProgressHUD+MJ.h"
#import "ForgetPassController.h"
#import "LDTextField.h"
#import "UIBarButtonItem+ENTER.h"
#import "CheckInForgetController.h"
@interface ForgetPassController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet LDTextField *telnumTextField;

@end

@implementation ForgetPassController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"输入手机号找回密码";
    [self setuptextField];
    [self setNav];
}
- (void)setNav
{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(nextStep) title:@"下一步"];
}
- (void)nextStep
{
    NSDataDetector *detector = [[NSDataDetector alloc] initWithTypes:NSTextCheckingTypePhoneNumber error:nil];
    NSUInteger numberofMatches = [detector numberOfMatchesInString:self.telnumTextField.text options:0 range:NSMakeRange(0, [self.telnumTextField.text length])];
    if (numberofMatches == 1) {
        //发送验证码
        [self getCheckIn];
    }else
    {
//        [MBProgressHUD showError:@"请输入正确手机号"];
        CGFloat x = self.telnumTextField.layer.position.x;
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
        animation.keyPath = @"position.x";
        animation.values = @[@(x - 5),@(x),@(x + 5),@(x - 5),@(x),@(x + 5)];
        animation.duration = 0.5;
        animation.additive = NO;
        [self.telnumTextField.layer addAnimation:animation forKey:@"shake"];
    }
    
}
- (void)getCheckIn
{

    [SignUpTool chekWithTelnum:self.telnumTextField.text success:^(id result) {
        if ([result[@"status"] isEqualToString:@"S"]) {
            
        }else
        {
        }
    } failure:^(NSError *error) {
    }];
    
    CheckInForgetController *check = [[CheckInForgetController alloc] init];
    check.telnum = self.telnumTextField.text;
    [self.navigationController pushViewController:check animated:YES];
    
}
- (void)setuptextField
{
    [self.telnumTextField setupTextFieldWithImage:nil
                                         selImage:@"login_img_focus"
                                         delegate:self];
    self.telnumTextField.leftButton.selected = YES;
}

@end
