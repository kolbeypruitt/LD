//
//  DoctorTabbarController.m
//  邻医家
//
//  Created by Daniel on 15/6/17.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "DoctorTabbarController.h"
#import "PublicHomeController.h"
#import "IWMeViewController.h"
#import "DoctorPlatformController.h"
@interface DoctorTabbarController ()

@end

@implementation DoctorTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupAllChildViewControllers
{
     // 1.首页
    PublicHomeController *home = [[PublicHomeController alloc] init];
    [self setupChildViewController:home title:@"首页" imageName:@"tab_guide" selectedImageName:@"tab_guide_click"];
    self.home = home;
    
    //2.招聘
    DoctorPlatformController *enter = [[DoctorPlatformController alloc] init];
    [self setupChildViewController:enter title:@"平台" imageName:@"tab_diary" selectedImageName:@"tab_diary_click"];
    // 3.我
    IWMeViewController *me = [[IWMeViewController alloc] init];
    [self setupChildViewController:me title:@"设置" imageName:@"tab_settings" selectedImageName:@"tab_settings_click"];
    self.me = me;
}

@end
