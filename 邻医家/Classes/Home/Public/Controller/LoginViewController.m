//
//  LoginViewController.m
//  邻医家
//
//  Created by Daniel on 15/5/15.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "HospitalPlatformController.h"
#import "DepartmentPlatformController.h"
#import "IWTabBarViewController.h"
#import "PublicHomeController.h"
#import "DoctorTabbarController.h"
#import "PatientTabbarController.h"
#import "ForgetPassController.h"
#import "UIImage+MJ.h"
#import "Account.h"
#import "AccountTool.h"
#import "SignUpViewController.h"
#import "Common.h"
#import "MBProgressHUD+MJ.h"
#import "IWCommon.h"
#import "LoginViewController.h"
#import "UIBarButtonItem+MJ.h"
#import "LDTextField.h"
#import "LoginTool.h"
#import "SignUpParam.h"
#import "LoginResult.h"
@interface LoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet LDTextField *telnumField;
@property (weak, nonatomic) IBOutlet LDTextField *passwdField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation LoginViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage resizedImageWithName:@"reg_btn_bg_blue_big"] forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemwithTitle:@"注册" target:self action:@selector(signUpBtnClicked)];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemwithTitle:@"返回" target:self action:@selector(backBtnClicked)];
    [self setupTitle];
    [self setupTextField];
}
- (void)backBtnClicked
{
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)signUpBtnClicked
{
    SignUpViewController *sign = [[SignUpViewController alloc] init];
    [self.navigationController pushViewController:sign animated:YES];
}
- (void)setupTextField
{
    [self.telnumField setupTextFieldWithImage:@"login_img" selImage:@"login_img_focus" delegate:self];
    [self.passwdField setupTextFieldWithImage:@"pwd_img" selImage:@"pwd_img_focus" delegate:self];
}
- (void)setupTitle
{
    UILabel *centerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    centerLabel.text = @"登录";
    centerLabel.textColor = [UIColor whiteColor];
    centerLabel.backgroundColor = [UIColor clearColor];
    centerLabel.font = [UIFont boldSystemFontOfSize:15];
    self.navigationItem.titleView = centerLabel; 
}
- (IBAction)forgetPasswdBtn:(id)sender {
    ForgetPassController *forget = [[ForgetPassController alloc] init];
    [self.navigationController pushViewController:forget animated:YES];
}
- (IBAction)loginBtn:(id)sender {
    if (self.telnumField.text.length) {
        if (self.passwdField.text.length) {
            SignUpParam *param = [SignUpParam paramWithTel:self.telnumField.text
                                                      code:nil
                                                    passwd:self.passwdField.text];
            
            [LoginTool loginWithParam:param success:^(LoginResult *result) {
                if ([result.status isEqualToString:SUCCESSSTATUS]) {
                    Account *at = [AccountTool account];
                    if (at == nil )
                    {
                        at = (Account *)result;
                        [AccountTool saveAccount:at];
                    }
                    [self chooseRootController];
                }else
                {
                    [MBProgressHUD showError:@"用户名或密码错误"];
                }
            } failure:^(NSError *error) {
                
            }];
        }else
        {
            [MBProgressHUD showError:@"请输入密码"];
        }
    }else
    {
        [MBProgressHUD showError:@"请输入手机号"];
    }
}
- (void)chooseRootController
{
    Account *userAccount = [AccountTool account];
    if (userAccount.type == 0)
    {//注册用户
        IWTabBarViewController *publicHome = [[IWTabBarViewController alloc] init];
        self.view.window.rootViewController = publicHome;
    }else if(userAccount.type == 1)
    {//医院管理者
        HospitalPlatformController *hosplat = [[HospitalPlatformController alloc] init];
        self.view.window.rootViewController = hosplat;
    }else if(userAccount.type == 2)
    {//入驻医生
        DoctorTabbarController *doc = [[DoctorTabbarController alloc] init];
        self.view.window.rootViewController = doc;
    } else if(userAccount.type == 3)
    {//入驻医友
        PatientTabbarController *patient = [[PatientTabbarController alloc] init];
        self.view.window.rootViewController = patient;
    }else if (userAccount.type == 4)
    {//科室主任
        DepartmentPlatformController *depart = [[DepartmentPlatformController alloc] init];
        self.view.window.rootViewController = depart;
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










