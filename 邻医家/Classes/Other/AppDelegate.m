//
//  AppDelegate.m
//  邻医家
//
//  Created by Daniel on 15/4/29.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//

#import "AppDelegate.h"
#import "AuditTabBarController.h"
#import "DepartmentPlatformController.h"
#import "HospitalPlatformController.h"
#import "IWTabBarViewController.h"
#import "PublicHomeController.h"
#import "IWNavigationController.h"
#import "PatientTabbarController.h"
#import "DepartmentPlatformController.h"
#import "Account.h"
#import "DoctorTabbarController.h"
#import "AccountTool.h"
#import <unistd.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    sleep(2);
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    if ([AccountTool isLogin]) {
        Account *userAccount = [AccountTool account];
        switch (userAccount.type) {
            case 0:
            {
                //注册用户
                IWTabBarViewController *iwVC = [[IWTabBarViewController alloc] init];
                self.window.rootViewController = iwVC;
                break;
            }
            case 1:
            {
                //医院管理者
                HospitalPlatformController *hosplat = [[HospitalPlatformController alloc] init];
                self.window.rootViewController = hosplat;
                break;
            }
            case 2:
            {
                //入驻医生
                DoctorTabbarController *doc = [[DoctorTabbarController alloc] init];
                self.window.rootViewController = doc;
                break;
            }
            case 3:
            {
                //入驻医友
                PatientTabbarController *patient = [[PatientTabbarController alloc] init];
                self.window.rootViewController = patient;
                break;
            }
            case 4:
            {
                //科室主任
                DepartmentPlatformController *depart = [[DepartmentPlatformController alloc] init];
                self.window.rootViewController = depart;
                break;
            }
            case 5:
            {
                //正在审核
                AuditTabBarController *auditVC = [[AuditTabBarController alloc] init];
                self.window.rootViewController = auditVC;
                break;
            }
        }
    }
    else
        {
            PublicHomeController *publicHome = [[PublicHomeController alloc] init];
            IWNavigationController *nav = [[IWNavigationController alloc] initWithRootViewController:publicHome];
            self.window.rootViewController = nav;
        }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
//    NSLog(@"App did enter background");
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
