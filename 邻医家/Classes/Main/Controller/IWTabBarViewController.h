//
//  IWTabBarViewController.h
//  ItcastWeibo
//
//  Created by apple on 14-5-5.
//  Copyright (c) 2014年 itcast. All rights reserved.
//
@class IWTabBar,PublicHomeController,IWMeViewController;
#import <UIKit/UIKit.h>

@interface IWTabBarViewController : UITabBarController
/**
 *  自定义的tabbar
 */
@property (nonatomic, weak) IWTabBar *customTabBar;
//@property (nonatomic, strong) PublicHomeController *home;
@property (nonatomic,strong) PublicHomeController *home;
@property (nonatomic, strong) IWMeViewController *me;


/**
 *  初始化所有的子控制器
 */
- (void)setupAllChildViewControllers;

- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName;
@end
