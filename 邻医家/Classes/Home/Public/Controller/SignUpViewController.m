//
//  SignUpViewController.m
//  邻医家
//
//  Created by Daniel on 15/5/15.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "NSString+Check.h"
#import "BaseResult.h"
#import "IWCommon.h"
#import "UIBarButtonItem+ENTER.h"
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
@property (weak, nonatomic) IBOutlet UIButton *codeBtn;
@property (weak, nonatomic) IBOutlet LDTextField *firstpwdField;
@property (weak, nonatomic) IBOutlet LDTextField *secondpwdField;
@property (weak, nonatomic) IBOutlet LDTextField *checkinField;
@property (weak, nonatomic) IBOutlet UIButton *signUpBtn;

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
    self.navigationItem.title = @"注册";
    [self.signUpBtn setBackgroundColor:IWColor(88, 202, 204)];
}


- (void)setupTextField
{
    [self.telnumField setupTextFieldWithImage:@"login_img" selImage:@"login_img_focus" delegate:self];
    [self.firstpwdField setupTextFieldWithImage:@"pwd_img" selImage:@"pwd_img_focus" delegate:self];
    [self.secondpwdField setupTextFieldWithImage:@"pwd_img" selImage:@"pwd_img_focus" delegate:self];
    self.checkinField.delegate = self;
}
- (IBAction)signupClicked:(id)sender {
 
    if ([self messageComplete]) {
        self.signUpBtn.enabled = NO;
        
        __weak typeof(self) weakSelf = self;
        
        SignUpParam *param = [SignUpParam paramWithTel:self.telnumField.text code:self.checkinField.text passwd:self.firstpwdField.text];
        [SignUpTool signUpWithParam:param success:^(SignUpResult *result) {
            if ([result.status isEqualToString:@"S"]) {
                
                const int count = self.navigationController.childViewControllers.count;
                UIViewController *rootVC = self.navigationController.childViewControllers[count - 3];
                [weakSelf.navigationController popToViewController:rootVC animated:YES];
                
            }else
            {
                [MBProgressHUD showError:result.errorMsg];
                weakSelf.codeBtn.enabled = YES;
                weakSelf.signUpBtn.enabled = YES;
            }
        } failure:^(NSError *error) {
            weakSelf.signUpBtn.enabled = YES;
            weakSelf.codeBtn.enabled = YES;
        }];
    }
    

}
- (BOOL)messageComplete
{
    if (![self.telnumField.text dg_isPhoneNumber]) {
        [MBProgressHUD showError:@"请输入手机号"];
        return NO;
    }
    if (![self.firstpwdField.text dg_isValidPassword] || ![self.secondpwdField.text dg_isValidPassword]) {
        [MBProgressHUD showError:@"请输入6位以上密码"];
        return NO;
    }else
    {
        if (![self.firstpwdField.text isEqualToString:self.secondpwdField.text]) {
            [MBProgressHUD showError:@"两次密码不匹配"];
            return NO;
        }
        else
        {
            return YES;
        }
    }
}

- (IBAction)getCheckIn:(id)sender {
    UIButton *button = (UIButton *)sender;
    
    if (self.telnumField.text.length) {
        
        button.enabled = NO;
        
        [SignUpTool getCheckInWithTelnum:self.telnumField.text success:^(BaseResult *result) {
            if ([result.status isEqualToString:@"S"]) {
                
            }else
            {
                [MBProgressHUD showError:@"验证码发送失败，请重试!"];
                button.enabled = YES;
            }
            
        } failure:^(NSError *error) {
            [MBProgressHUD showError:@"请求网络失败!"];
            button.enabled = YES;
        }];
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







