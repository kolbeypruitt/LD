//
//  CheckInForgetController.m
//  邻医家
//
//  Created by Daniel on 15/5/22.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "CheckInForgetController.h"

@interface CheckInForgetController ()
@property (weak, nonatomic) IBOutlet UILabel *telnumLabel;

@end

@implementation CheckInForgetController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"填写短信验证码";
    self.telnumLabel.text = self.telnum;
}
- (IBAction)nextStep:(id)sender {
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)setTelnum:(NSString *)telnum
{
    _telnum = telnum;
}

@end
