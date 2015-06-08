//
//  SignUpViewController.m
//  邻医家
//
//  Created by Daniel on 15/5/15.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "UIBarButtonItem+MJ.h"
#import "SignUpViewController.h"
#import "LDTextField.h"
#import "UIButton+SignUp.h"
#import "PublicHomeController.h"
#import "SignUpTool.h"
#import "SignUpParam.h"
#import "SignUpResult.h"
#import "MBProgressHUD+MJ.h"
@interface SignUpViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet LDTextField *telnumField;
@property (weak, nonatomic) IBOutlet LDTextField *firstpwdField;
@property (weak, nonatomic) IBOutlet LDTextField *secondpwdField;
@property (weak, nonatomic) IBOutlet LDTextField *checkinField;

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self setupTextField];
}
- (void)setupCheckinField
{
    
}
- (void)setNav
{
    [self setupTitle];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemwithTitle:@"返回" target:self action:@selector(leftBarBtnClicked)];
    self.navigationItem.rightBarButtonItem = nil;
}
- (void)leftBarBtnClicked
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)setupTitle
{
    UILabel *centerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    centerLabel.text = @"注册";
    centerLabel.textColor = [UIColor whiteColor];
    centerLabel.backgroundColor = [UIColor clearColor];
    centerLabel.font = [UIFont boldSystemFontOfSize:15];
    self.navigationItem.titleView = centerLabel; 
}
- (void)setupTextField
{
    [self.telnumField setupTextFieldWithImage:@"login_img" selImage:@"login_img_focus" delegate:self];
    [self.firstpwdField setupTextFieldWithImage:@"pwd_img" selImage:@"pwd_img_focus" delegate:self];
    [self.secondpwdField setupTextFieldWithImage:@"pwd_img" selImage:@"pwd_img_focus" delegate:self];
    self.checkinField.delegate = self;
}
- (IBAction)signupClicked:(id)sender {
    if (self.telnumField.text.length) {//手机号不为空
        if ([self matchPassWord]) {//密码匹配
            if (self.checkinField.text.length) {//验证码不为空
                SignUpParam *param = [SignUpParam paramWithTel:self.telnumField.text code:self.checkinField.text passwd:self.firstpwdField.text];
                [SignUpTool signUpWithParam:param success:^(SignUpResult *result) {
                    if ([result.status isEqualToString:@"S"]) {
                        [self.navigationController popToRootViewControllerAnimated:YES];
                    }else
                    {
                        switch (result.errorCode) {
                            case 1:
                                [MBProgressHUD showError:@"请求超时"];
                                break;
                                
                            case 2:
                                [MBProgressHUD showError:@"此手机已注册"];
                                break;
                            case 3:
                                [MBProgressHUD showError:@"请输入字母和数字的密码"];
                                break;
                            case 4:
                                [MBProgressHUD showError:@"验证码错误"];
                                break;
                            default:
                                break;
                        }
                    }
                } failure:^(NSError *error) {
                    NSLog(@"error");
                }];
            }else//验证码为空
            {
                [MBProgressHUD showError:@"请输入验证码"];
            }
            
        }
    }else//手机号为空
    {
        [MBProgressHUD showError:@"请输入手机号"];
    }
   
}
- (BOOL)matchPassWord
{
    if (self.firstpwdField.text.length >= 6) {
        if (self.firstpwdField.text.length && self.secondpwdField.text.length) {
            if ([self.firstpwdField.text isEqualToString:self.secondpwdField.text]) {
                return YES;
            }else
            {
                [MBProgressHUD showError:@"两次密码不相同"];
                return NO;
            }
        }else
        {
            [MBProgressHUD showError:@"请确认密码"];
            return NO;
        }
    }else
    {
        [MBProgressHUD showError:@"请输入6位以上密码"];
        return NO;
    }
    
    
}
- (IBAction)getCheckIn:(id)sender {
    NSLog(@"come here");
    if (self.telnumField.text.length) {
        [SignUpTool getCheckInWithTelnum:self.telnumField.text
                                 success:^{
                                     NSLog(@"验证码发送成功");}
                                 failure:^(NSError *error) {}];
    }else
    {
        [MBProgressHUD showError:@"请输入手机号"];
    }
    
}
#pragma mark - textfield delegate method
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    LDTextField *te = (LDTextField *)textField;
    te.leftButton.selected = YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    LDTextField *te = (LDTextField *)textField;
    te.leftButton.selected = NO;
}
@end







