//
//  DepartmentPlatformController.m
//  邻医家
//
//  Created by Daniel on 15/6/19.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#import "Common.h"
#import "IWNavigationController.h"
#import "PublicHomeController.h"
#import "IWMeViewController.h"
#import "DepartmentDirectorController.h"
#import "DepartmentPlatformController.h"
#import "IWTabBar.h"
#import "UIImage+MJ.h"

@interface DepartmentPlatformController () <IWTabBarDelegate>

@end

@implementation DepartmentPlatformController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 删除系统自动生成的UITabBarButton
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

/**
 *  初始化tabbar
 */
- (void)setupTabbar
{
    IWTabBar *customTabBar = [[IWTabBar alloc] init];
    customTabBar.frame = self.tabBar.bounds;
    customTabBar.delegate = self;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
}

#pragma mark - tabbar的代理方法
/**
 *  监听tabbar按钮的改变
 *  @param from   原来选中的位置
 *  @param to     最新选中的位置
 */
- (void)tabBar:(IWTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to
{
    self.selectedIndex = to;

}
/**
 *  初始化所有的子控制器
 */
- (void)setupAllChildViewControllers
{
    // 1.首页
    PublicHomeController *home = [[PublicHomeController alloc] init];
    [self setupChildViewController:home title:@"首页" imageName:@"tab_guide" selectedImageName:@"tab_guide_click"];
    self.home = home;
    
    //2.招聘
    DepartmentDirectorController  *enter = [[DepartmentDirectorController alloc] init];
    [self setupChildViewController:enter title:@"平台" imageName:@"tab_diary" selectedImageName:@"tab_diary_click"];
    // 3.我
    IWMeViewController *me = [[IWMeViewController alloc] init];
    [self setupChildViewController:me title:@"设置" imageName:@"tab_settings" selectedImageName:@"tab_settings_click"];
    self.me = me;
}

/**
 *  初始化一个子控制器
 *
 *  @param childVc           需要初始化的子控制器
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 1.设置控制器的属性
    childVc.title = title;
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageWithName:imageName];
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageWithName:selectedImageName];
    if (iOS7) {
        childVc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    } else {
        childVc.tabBarItem.selectedImage = selectedImage;
    }
    
    // 2.包装一个导航控制器
    IWNavigationController *nav = [[IWNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
    // 3.添加tabbar内部的按钮
    [self.customTabBar addTabBarButtonWithItem:childVc.tabBarItem];
}

@end
