//
//  AuditViewController.m
//  邻医家
//
//  Created by Daniel on 15/7/20.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "AuditViewController.h"
#import "Common.h"
@interface AuditViewController ()
@property (weak, nonatomic) IBOutlet UILabel *auditTitle;

@end

@implementation AuditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setup];
}
- (void)setup
{
    self.navigationItem.title = @"审核状态";
    self.auditTitle.textColor = IWColor(88, 202, 203);
    self.auditTitle.text = @"你的资料已提交成功,系统正在审核。";
    
}




@end
