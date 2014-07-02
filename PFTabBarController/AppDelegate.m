//
//  AppDelegate.m
//  PFTabBarController
//
//  Created by PFei_He on 14-7-2.
//  Copyright (c) 2014年 PFei_He. All rights reserved.
//

#import "AppDelegate.h"
#import "PF_A0_VC.h"
#import "PF_B0_VC.h"
#import "PF_C0_VC.h"
#import "PF_D0_VC.h"
#import "PF_E0_VC.h"
#import "PFTabBarController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];

    //创建ViewController
    PF_A0_VC *A0 = [[PF_A0_VC alloc] init];
    PF_B0_VC *B0 = [[PF_B0_VC alloc] init];
    PF_C0_VC *C0 = [[PF_C0_VC alloc] init];
    PF_D0_VC *D0 = [[PF_D0_VC alloc] init];
    PF_E0_VC *E0 = [[PF_E0_VC alloc] init];

    //视图控制器的数组
    NSArray *array = [[NSArray alloc] initWithObjects:A0, B0, C0, D0, E0, nil];

    //创建自定义TabBar
    PFTabBarController *tabBar = [[PFTabBarController alloc] initWithViewControl:array];

    //设置一个属性获取TabBar
    _tabBar = tabBar;

    //初始化TabBar时选中的按钮（不设置则为0）
    //    tabBar.selectedNumber = 3;

    //常规按钮的图片数组
    NSArray *normal = [[NSArray alloc] initWithObjects:@"a_off.png", @"b_off.png", @"c_off.png", @"d_off.png", @"e_off.png", nil];

    //选中按钮的图片数组
    NSArray *selected = [[NSArray alloc] initWithObjects:@"a_on.png", @"b_on.png", @"c_on.png", @"d_on.png", @"e_on.png", nil];

    //TabBar的文字数组
    NSArray *label = [[NSArray alloc] initWithObjects:@"one", @"two", @"three", @"four", @"five", nil];

    //调用自定义的方法设置TabBar上的视图
    [tabBar tabBarWithImage:@"background.png" normal:normal selected:selected label:label];

    //设置自定义的TabBar为主控制器
    self.window.rootViewController = tabBar;

    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
